---@class PaletteColors
---@field accent string
local palette = {
  -- dark
  dark = "#0c0d10",
  dark00 = "#101215",
  dark0 = "#14161a",
  dark1 = "#1c1f24",
  dark2 = "#282c34",
  dark3 = "#3e4148",
  dark4 = "#53565d",
  dark5 = "#696b71",

  -- white
  white = "#ffffff",
  white0 = "#eaeaeb",
  white1 = "#bfc0c2",
  white2 = "#a9abae",

  -- red
  red = "#5a2b2f",
  red0 = "#ca6169",
  red1 = "#e06c75",
  red2 = "#e68991",

  -- amber
  amber = "#664029",
  amber0 = "#e6905c",
  amber1 = "#ffa066",
  amber2 = "#ffb385",

  -- yellow
  yellow = "#5c4d31",
  yellow0 = "#cead6f",
  yellow1 = "#e5c07b",
  yellow2 = "#eacd95",

  -- green
  green = "#3d4e30",
  green0 = "#7a9c61",
  green1 = "#98c379",
  green2 = "#adcf94",

  -- aqua
  aqua = "#285248",
  aqua0 = "#51a490",
  aqua1 = "#65cdb4",
  aqua2 = "#84d7c3",

  -- blue
  blue = "#274660",
  blue0 = "#4e8cbf",
  blue1 = "#61afef",
  blue2 = "#81bff2",

  -- violet
  violet = "#3b2442",
  violet0 = "#9e60b1",
  violet1 = "#c678dd",
  violet2 = "#d193e4",

  -- magenta
  magenta = "#422436",
  magenta0 = "#b1608f",
  magenta1 = "#dd78b3",
  magenta2 = "#e493c2",
}

local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to InterstellarConfig.colors.
---   - theme: Use selected theme. Defaults to InterstellarConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string, accent?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
  opts = opts or {}
  local override_colors = opts.colors or require("interstellar").config.colors
  local theme = opts.theme or require("interstellar")._CURRENT_THEME -- WARN: this fails if called before interstellar.load()

  if not theme then
    error(
      "interstellar.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme interstellar'"
    )
  end

  -- Add to and/or override palette_colors
  local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

  -- Generate the theme according to the updated palette colors
  local theme_colors = require("interstellar.themes")[theme](updated_palette_colors, opts.accent)

  -- Add to and/or override theme_colors
  local theme_overrides =
    vim.tbl_deep_extend("force", override_colors.theme["all"] or {}, override_colors.theme[theme] or {})
  local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, theme_overrides)
  -- return palette_colors AND theme_colors

  return {
    theme = updated_theme_colors,
    palette = updated_palette_colors,
  }
end

return M
