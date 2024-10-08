local M = {}

---@param colors InterstellarColors
---@param config? InterstellarConfig
function M.setup(colors, config)
  ---@diagnostic disable-next-line: unused-local
  config = config or require("interstellar").config -- luacheck:ignore
  local theme = colors.theme

  return {
    -- Neovcs
    -- NeovcsBranch = {},
    -- NeovcsRemote = {},
    -- NeovcsDiffDelete = { fg = theme.vcs.removed, bg = theme.diff.delete },
    -- NeovcsDiffAdd = { fg = theme.vcs.added, bg = theme.diff.add },
    -- NeovcsHunkHeader = { fg = theme.syn.identifier },
    -- NeovcsDiffContextHighlight = { bg = theme.diff.change },

    -- vcsSigns
    -- vcsSignsAdd = { link = "diffAdded" },
    -- vcsSignsChange = { link = "diffChanged" },
    -- vcsSignsDelete = { link = "diffDeleted" },
    -- vcsSignsDeleteLn = { bg = theme.diff.delete },

    -- Gitsigns
    GitSignsAdd = { fg = theme.vcs.added },
    GitSignsChange = { fg = theme.vcs.changed },
    GitSignsDelete = { fg = theme.vcs.removed },

    -- Neogit
    NeogitDiffContextHighlight = { bg = theme.diff.change }, --[[  guibg=#333333 guifg=#b2b2b2 ]]
    NeogitHunkHeader = { fg = theme.syn.fun }, --[[  guifg=#cccccc guibg=#404040 ]]
    NeogitHunkHeaderHighlight = { fg = theme.syn.constant, bg = theme.diff.change }, --[[ guifg=#cccccc guibg=#4d4d4d ]]
    NeogitDiffAddHighlight = { bg = theme.diff.add },
    NeogitDiffDeleteHighlight = { bg = theme.diff.delete },

    -- TreeSitter Extensions
    TreesitterContext = { link = "Folded" },
    TreesitterContextLineNumber = { fg = theme.ui.special, bg = theme.ui.bg_gutter },

    -- Telescope
    TelescopeNormal = { fg = theme.ui.float.fg, bg = theme.ui.float.bg },
    TelescopeBorder = { fg = theme.ui.float.border, bg = theme.ui.float.bg },
    TelescopeTitle = { fg = theme.ui.special },
    TelescopeSelection = { link = "CursorLine" },
    TelescopeSelectionCaret = { link = "CursorLineNr" },
    TelescopeResultsClass = { link = "Structure" },
    TelescopeResultsStruct = { link = "Structure" },
    TelescopeResultsField = { link = "@field" },
    TelescopeResultsMethod = { link = "Function" },
    TelescopeResultsVariable = { link = "@variable" },

    -- NvimTree
    NvimTreeNormal = { link = "Normal" },
    NvimTreeNormalNC = { link = "NvimTreeNormal" },
    NvimTreeRootFolder = { fg = theme.syn.identifier, bold = true },
    NvimTreeGitDirty = { fg = theme.vcs.changed },
    NvimTreeGitNew = { fg = theme.vcs.added },
    NvimTreeGitDeleted = { fg = theme.vcs.removed },
    NvimTreeGitStaged = { fg = theme.vcs.added },
    NvimTreeSpecialFile = { fg = theme.syn.special1 },

    -- NvimTreeIndentMarker           = {},
    NvimTreeImageFile = { fg = theme.syn.special2 },
    NvimTreeSymlink = { link = "Type" },
    NvimTreeFolderName = { link = "Directory" },
    NvimTreeExecFile = { fg = theme.syn.string, bold = true },
    NvimTreeOpenedFile = { fg = theme.syn.special1, italic = true },
    NvimTreeWinSeparator = { link = "WinSeparator" },
    NvimTreeWindowPicker = { bg = theme.ui.bg_m1, fg = theme.syn.special1, bold = true },

    -- NeoTree
    NeoTreeTabInactive = { link = "TabLine" },
    NeoTreeTabActive = { link = "TabLineSel" },
    NeoTreeTabSeparatorInactive = { link = "NeoTreeTabInactive" },
    NeoTreeTabSeparatorActive = { link = "NeoTreeTabActive" },
    NeoTreeRootName = { fg = theme.syn.identifier, bold = true },
    NeoTreeModified = { link = "String" },
    NeoTreeGitModified = { fg = theme.vcs.changed },
    NeoTreeGitAdded = { fg = theme.vcs.added },
    NeoTreeGitDeleted = { fg = theme.vcs.removed },
    NeoTreeGitStaged = { fg = theme.vcs.added },
    NeoTreeGitConflict = { fg = theme.diag.error },
    NeoTreeGitUntracked = { link = "NeoTreeGitModified", default = true },
    NeoTreeGitUnstaged = { link = "NeoTreeGitModified", default = true },
    NeoTreeIndentMarker = { link = "NonText" },

    -- WindowPicker
    -- NvimWindowSwitch = { bg = theme.ui.bg_m2, fg = theme.diag.warning },
    -- NvimWindowSwitchNC = { link = "NvimWindowSwitch" },

    -- Dashboard
    DashboardShortCut = { fg = theme.syn.statement },
    DashboardHeader = { fg = theme.ui.accent },
    DashboardCenter = { fg = theme.syn.constant },
    DashboardFooter = { fg = theme.syn.identifier },
    DashboardDesc = { fg = theme.syn.variable },
    DashboardKey = { fg = theme.syn.number },
    DashboardIcon = { fg = theme.ui.special },
    -- Notify
    NotifyBackground = { bg = theme.ui.bg },
    NotifyERRORBorder = { link = "DiagnosticError" },
    NotifyWARNBorder = { link = "DiagnosticWarn" },
    NotifyINFOBorder = { link = "DiagnosticInfo" },
    NotifyHINTBorder = { link = "DiagnosticHint" },
    NotifyDEBUGBorder = { link = "Debug" },
    NotifyTRACEBorder = { link = "Comment" },
    NotifyERRORIcon = { link = "DiagnosticError" },
    NotifyWARNIcon = { link = "DiagnosticWarn" },
    NotifyINFOIcon = { link = "DiagnosticInfo" },
    NotifyHINTIcon = { link = "DiagnosticHint" },
    NotifyDEBUGIcon = { link = "Debug" },
    NotifyTRACEIcon = { link = "Comment" },
    NotifyERRORTitle = { link = "DiagnosticError" },
    NotifyWARNTitle = { link = "DiagnosticWarn" },
    NotifyINFOTitle = { link = "DiagnosticInfo" },
    NotifyHINTTitle = { link = "DiagnosticHint" },
    NotifyDEBUGTitle = { link = "Debug" },
    NotifyTRACETitle = { link = "Comment" },

    -- Dap-UI
    -- DapUIVariable = { link = "Normal" },
    DapUIScope = { link = "Special" }, -- guifg=#00F1F5"
    DapUIType = { link = "Type" }, -- guifg=#D484FF"
    -- DapUIValue = { link = "Normal" },
    DapUIModifiedValue = { fg = theme.syn.special1, bold = true }, -- guifg=#00F1F5 gui=bold"
    DapUIDecoration = { fg = theme.ui.float.border }, -- guifg=#00F1F5"
    DapUIThread = { fg = theme.syn.identifier }, --guifg=#A9FF68"
    DapUIStoppedThread = { fg = theme.syn.special1 }, --guifg=#00f1f5"
    -- DapUIFrameName = { link = "Normal"},
    DapUISource = { fg = theme.syn.special2 }, -- guifg=#D484FF"
    DapUILineNumber = { fg = theme.syn.special1 }, -- guifg=#00f1f5"
    DapUIFloatBorder = { fg = theme.ui.float.border }, -- guifg=#00F1F5"
    DapUIWatchesEmpty = { fg = theme.diag.error }, -- guifg=#F70067"
    DapUIWatchesValue = { fg = theme.syn.identifier }, -- guifg=#A9FF68"
    DapUIWatchesError = { fg = theme.diag.error }, --guifg=#F70067"
    DapUIBreakpointsPath = { link = "Directory" }, --guifg=#00F1F5"
    DapUIBreakpointsInfo = { fg = theme.diag.info }, --guifg=#A9FF68"
    DapUIBreakpointsCurrentLine = { fg = theme.syn.identifier, bold = true }, --guifg=#A9FF68 gui=bold"
    -- DapUIBreakpointsLine = {}, -- DapUILineNumber"
    DapUIBreakpointsDisabledLine = { link = "Comment" }, --guifg=#424242"
    -- DapUICurrentFrameName = {}, -- DapUIBreakpointsCurrentLine"
    DapUIStepOver = { fg = theme.syn.special1 }, --guifg=#00f1f5"
    DapUIStepInto = { fg = theme.syn.special1 }, --guifg=#00f1f5"
    DapUIStepBack = { fg = theme.syn.special1 }, --guifg=#00f1f5"
    DapUIStepOut = { fg = theme.syn.special1 }, --guifg=#00f1f5"
    DapUIStop = { fg = theme.diag.error }, --guifg=#F70067"
    DapUIPlayPause = { fg = theme.syn.string }, --guifg=#A9FF68"
    DapUIRestart = { fg = theme.syn.string }, --guifg=#A9FF68"
    DapUIUnavailable = { fg = theme.syn.comment }, --guifg=#424242"

    -- Floaterm
    FloatermBorder = { fg = theme.ui.float.border, bg = theme.ui.bg },

    -- NeoVim                         = {},
    healthError = { fg = theme.diag.error },
    healthSuccess = { fg = theme.diag.ok },
    healthWarning = { fg = theme.diag.warning },

    -- Cmp
    CmpDocumentation = { link = "NormalFloat" },
    CmpDocumentationBorder = { link = "FloatBorder" },
    CmpCompletion = { link = "Pmenu" },
    CmpCompletionSel = { fg = "NONE", bg = theme.ui.pmenu.bg_sel },
    CmpCompletionBorder = { fg = theme.ui.bg_search, bg = theme.ui.pmenu.bg },
    CmpCompletionThumb = { link = "PmenuThumb" },
    CmpCompletionSbar = { link = "PmenuSbar" },
    CmpItemAbbr = { fg = theme.ui.pmenu.fg },
    CmpItemAbbrDeprecated = { fg = theme.syn.comment, strikethrough = true },
    CmpItemAbbrMatch = { fg = theme.syn.fun },
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
    CmpItemKindDefault = { fg = theme.ui.fg_dark },
    CmpItemMenu = { fg = theme.ui.fg_dark },

    CmpItemKindText = { fg = theme.ui.fg },
    CmpItemKindMethod = { link = "@function.method" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindConstructor = { link = "@constructor" },
    CmpItemKindField = { link = "@variable.member" },
    CmpItemKindVariable = { fg = theme.ui.fg_dark },
    CmpItemKindClass = { link = "Type" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindModule = { link = "@module" },
    CmpItemKindProperty = { link = "@property" },
    CmpItemKindUnit = { link = "Number" },
    CmpItemKindValue = { link = "String" },
    CmpItemKindEnum = { link = "Type" },
    CmpItemKindKeyword = { link = "Keyword" },
    CmpItemKindSnippet = { link = "Special" },
    CmpItemKindColor = { link = "Special" },
    CmpItemKindFile = { link = "Directory" },
    CmpItemKindReference = { link = "Special" },
    CmpItemKindFolder = { link = "Directory" },
    CmpItemKindEnumMember = { link = "Constant" },
    CmpItemKindConstant = { link = "Constant" },
    CmpItemKindStruct = { link = "Type" },
    CmpItemKindEvent = { link = "Type" },
    CmpItemKindOperator = { link = "Operator" },
    CmpItemKindTypeParameter = { link = "Type" },
    CmpItemKindCopilot = { link = "String" },

    -- IndentBlankline
    IndentBlanklineChar = { fg = theme.ui.whitespace },
    IndentBlanklineSpaceChar = { fg = theme.ui.whitespace },
    IndentBlanklineSpaceCharBlankline = { fg = theme.ui.whitespace },
    IndentBlanklineContextChar = { fg = theme.ui.special },
    IndentBlanklineContextStart = { sp = theme.ui.special, underline = true },
    IblIndent = { fg = theme.ui.whitespace },
    IblWhitespace = { fg = theme.ui.whitespace },
    IblScope = { fg = theme.ui.special },

    -- Indentmini
    IndentLine = { fg = theme.ui.whitespace },
    IndentLineCurrent = { fg = theme.ui.special },

    -- Lazy
    LazyProgressTodo = { fg = theme.ui.nontext },

    -- Trouble
    TroubleIndent = { fg = theme.ui.whitespace },
    TroublePos = { fg = theme.ui.special },

    -- Nvim-Navic
    NavicIconsFile = { link = "Directory" },
    NavicIconsModule = { link = "@module" },
    NavicIconsNamespace = { link = "@module" },
    NavicIconsPackage = { link = "@module" },
    NavicIconsClass = { link = "Type" },
    NavicIconsMethod = { link = "@function.method" },
    NavicIconsProperty = { link = "@property" },
    NavicIconsField = { link = "@variable.member" },
    NavicIconsConstructor = { link = "@constructor" },
    NavicIconsEnum = { link = "Type" },
    NavicIconsInterface = { link = "Type" },
    NavicIconsFunction = { link = "Function" },
    NavicIconsVariable = { link = "@variable" },
    NavicIconsConstant = { link = "Constant" },
    NavicIconsString = { link = "String" },
    NavicIconsNumber = { link = "Number" },
    NavicIconsBoolean = { link = "Boolean" },
    NavicIconsArray = { link = "Type" },
    NavicIconsObject = { link = "Type" },
    NavicIconsKey = { link = "Identifier" },
    NavicIconsNull = { link = "Type" },
    NavicIconsEnumMember = { link = "Constant" },
    NavicIconsStruct = { link = "Structure" },
    NavicIconsEvent = { link = "Structure" },
    NavicIconsOperator = { link = "Operator" },
    NavicIconsTypeParameter = { link = "Type" },
    NavicText = { fg = theme.ui.fg },
    NavicSeparator = { fg = theme.ui.fg },

    -- Aerial icons
    AerialFileIcon = { link = "Directory" },
    AerialModuleIcon = { link = "@module" },
    AerialNamespaceIcon = { link = "@module" },
    AerialPackageIcon = { link = "@module" },
    AerialClassIcon = { link = "Type" },
    AerialMethodIcon = { link = "@function.method" },
    AerialPropertyIcon = { link = "@property" },
    AerialFieldIcon = { link = "@variable.member" },
    AerialConstructorIcon = { link = "@constructor" },
    AerialEnumIcon = { link = "Type" },
    AerialInterfaceIcon = { link = "Type" },
    AerialFunctionIcon = { link = "Function" },
    AerialVariableIcon = { link = "@variable" },
    AerialConstantIcon = { link = "Constant" },
    AerialStringIcon = { link = "String" },
    AerialNumberIcon = { link = "Number" },
    AerialBooleanIcon = { link = "Boolean" },
    AerialArrayIcon = { link = "Type" },
    AerialObjectIcon = { link = "Type" },
    AerialKeyIcon = { link = "Identifier" },
    AerialNullIcon = { link = "Type" },
    AerialEnumMemberIcon = { link = "Constant" },
    AerialStructIcon = { link = "Structure" },
    AerialEventIcon = { link = "Structure" },
    AerialOperatorIcon = { link = "Operator" },
    AerialTypeParameterIcon = { link = "Type" },

    -- HiPhish/rainbow-delimiters.nvim
    RainbowDelimiterRed = { fg = theme.term[10] },
    RainbowDelimiterGreen = { fg = theme.term[11] },
    RainbowDelimiterYellow = { fg = theme.term[12] },
    RainbowDelimiterBlue = { fg = theme.term[13] },
    RainbowDelimiterViolet = { fg = theme.term[14] },
    RainbowDelimiterOrange = { fg = theme.term[17] },
    RainbowDelimiterCyan = { fg = theme.term[15] },

    -- mini.files
    -- MiniFilesBorder = {},
    MiniFilesBorderModified = { fg = theme.diag.error },
    MiniFilesCursorLine = { bg = theme.ui.bg_p1 },
    MiniFilesDirectory = { fg = theme.ui.accent },
    MiniFilesFile = { fg = theme.ui.fg_dark },
    MiniFilesTitle = { fg = theme.ui.float.title },
    MiniFilesTitleFocused = { fg = theme.ui.float.title_focused },
  }
end

return M
