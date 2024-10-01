local M = {}

---@alias ColorSpec string RGB Hex string
---@alias ColorTable table<string, ColorSpec>
---@alias InterstellarColorsSpec { palette: ColorTable, theme: ColorTable }
---@alias InterstellarColors { palette: PaletteColors, theme: ThemeColors }

--- default config
---@class InterstellarConfig
M.config = {
  theme = "singularity",
  accent = "green1",
  compile = false,
  undercurl = true,
  style = {
    comments = { italic = true },
    functions = {},
    keywords = {},
    statements = { bold = true },
    types = {},
  },
  transparent = false,
  dimInactive = false,
  term = true,
  colors = { theme = { singularity = {}, horizon = {}, all = {} }, palette = {} },
  ---@type fun(colors: InterstellarColorsSpec): table<string, table>
  overrides = function()
    return {}
  end,
}

local function check_config(config)
  local err
  return not err
end

--- update global configuration with user settings
---@param config? InterstellarConfig user configuration
function M.setup(config)
  if check_config(config) then
    M.config = vim.tbl_deep_extend("force", M.config, config or {})
  else
    vim.notify("Interstellar: Errors found while loading user config. Using default config.", vim.log.levels.ERROR)
  end
end

--- load the colorscheme
---@param theme? string
function M.load(theme)
  local utils = require("interstellar.utils")

  theme = theme or M.config.theme
  M._CURRENT_THEME = theme

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.g.colors_name = "interstellar"
  vim.o.termguicolors = true

  if M.config.compile then
    if utils.load_compiled(theme) then
      return
    end

    M.compile()
    utils.load_compiled(theme)
  else
    local colors =
      require("interstellar.colors").setup({ theme = theme, colors = M.config.colors, accent = M.config.accent })
    local highlights = require("interstellar.highlights").setup(colors, M.config)
    require("interstellar.highlights").highlight(highlights, M.config.term and colors.theme.term or {})
  end
end

function M.compile()
  for theme, _ in pairs(require("interstellar.themes")) do
    local colors = require("interstellar.colors").setup({ theme = theme, colors = M.config.colors })
    local highlights = require("interstellar.highlights").setup(colors, M.config)
    require("interstellar.utils").compile(theme, highlights, M.config.term and colors.theme.term or {})
  end
end

vim.api.nvim_create_user_command("InterstellarCompile", function()
  for mod, _ in pairs(package.loaded) do
    if mod:match("^interstellar%.") then
      package.loaded[mod] = nil
    end
  end
  M.compile()
  vim.notify("Interstellar: compiled successfully!", vim.log.levels.INFO)
  M.load(M._CURRENT_THEME)
  vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end, {})

return M
