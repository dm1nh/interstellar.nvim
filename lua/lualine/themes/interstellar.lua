local theme = require("interstellar.colors").setup().theme

local interstellar = {}

interstellar.normal = {
  a = { bg = theme.syn.fun, fg = theme.ui.bg_m2 },
  b = { bg = theme.diff.change, fg = theme.syn.fun },
  c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
}

interstellar.insert = {
  a = { bg = theme.diag.ok, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.diag.ok },
}

interstellar.command = {
  a = { bg = theme.syn.operator, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.operator },
}

interstellar.visual = {
  a = { bg = theme.syn.keyword, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.keyword },
}

interstellar.replace = {
  a = { bg = theme.syn.constant, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.constant },
}

interstellar.inactive = {
  a = { bg = theme.ui.bg_m2, fg = theme.ui.fg_dark },
  b = { bg = theme.ui.bg_m2, fg = theme.ui.fg_dark, gui = "bold" },
  c = { bg = theme.ui.bg_m2, fg = theme.ui.fg_dark },
}

if vim.g.interstellar_lualine_bold then
  for _, mode in pairs(interstellar) do
    mode.a.gui = "bold"
  end
end

return interstellar
