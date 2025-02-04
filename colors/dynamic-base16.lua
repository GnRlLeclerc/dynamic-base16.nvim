local base16 = require('dynamic-base16')

local config = base16.config

-- Reload the custom colors module if it is specified
if config.module ~= nil then
  package.loaded[config.module] = nil
  local success, colors = pcall(require, config.module)
  if success then
    base16.set_colors(colors)
  end
end

-- Load colors after having loaded the custom module
local colors = base16.colors

-- Define the highlight groups
local highlights = {
  Normal = { fg = colors.base05, bg = colors.base00 },
  Terminal = { fg = colors.base05, bg = colors.base00 },
  Debug = { fg = colors.base08 },
  Directory = { fg = colors.base0D },
  Error = { fg = colors.base08 },
  ErrorMsg = { fg = colors.base08 },
  Exception = { fg = colors.base08 },
  FoldColumn = { fg = colors.base0C },
  Folded = { fg = colors.base03 },
  CurSearch = { fg = colors.base01, bg = colors.base0A },
  IncSearch = { link = 'CurSearch' },
  Macro = { fg = colors.base08 },
  MatchParen = { bg = colors.base03 },
  ModeMsg = { fg = colors.base0B },
  MoreMsg = { fg = colors.base0B },
  Question = { fg = colors.base0D },
  Search = { fg = colors.base01, bg = colors.base0A },
  Substitute = { link = 'CurSearch' },
  SpecialKey = { fg = colors.base03 },
  Underlined = { fg = colors.base08 },
  Visual = { bg = colors.base02 },
  WarningMsg = { fg = colors.base08 },
  WildMenu = { link = 'CurSearch' },
  Title = { fg = colors.base0D },
  Conceal = { bg = 'NONE' },
  Cursor = { fg = colors.base00, bg = colors.base05 },
  NonText = { fg = colors.base03 },
  LineNr = { fg = colors.base04 },
  SignColumn = { fg = colors.base04, bg = 'NONE' },
  StatusLine = { fg = colors.base05, bg = colors.base02 },
  StatusLineNC = { fg = colors.base04, bg = colors.base01 },
  WinBar = { fg = colors.base05 },
  WinBarNC = { fg = colors.base04 },
  WinSeparator = { fg = colors.base04 },
  VertSplit = { fg = colors.base05 },
  ColorColumn = { bg = colors.base01 },
  CursorColumn = { bg = colors.base01 },
  CursorLine = { bg = colors.base01 },
  CursorLineNr = { fg = colors.base04 },
  TabLine = { fg = colors.base03, bg = colors.base01 },
  TabLineFill = { bg = colors.base01 },
  TabLineSel = { fg = colors.base0B, bg = colors.base01 },

  -- Standard syntax highlighting
  Boolean = { fg = colors.base09 },
  Character = { fg = colors.base08 },
  Comment = { fg = colors.base03 },
  Conditional = { fg = colors.base0E },
  Constant = { fg = colors.base09 },
  Define = { fg = colors.base0E },
  Delimiter = { fg = colors.base05 },
  Float = { fg = colors.base09 },
  Function = { fg = colors.base0D },
  Identifier = { fg = colors.base08 },
  Include = { fg = colors.base0D },
  Keyword = { fg = colors.base0E },
  Label = { fg = colors.base0A },
  Number = { fg = colors.base09 },
  Operator = { fg = colors.base0E },
  PreProc = { fg = colors.base0A },
  Repeat = { fg = colors.base0A },
  Special = { fg = colors.base0C },
  SpecialChar = { fg = colors.base0F },
  Statement = { fg = colors.base08 },
  StorageClass = { fg = colors.base0A },
  String = { fg = colors.base0B },
  Structure = { fg = colors.base0E },
  Tag = { fg = colors.base0A },
  Todo = { fg = colors.base0A, bg = colors.base01 },
  Type = { fg = colors.base0A },
  Typedef = { fg = colors.base0A },

  -- Diff highlighting
  DiffAdd = { fg = colors.base0B },
  DiffChange = { fg = colors.base0C },
  DiffDelete = { fg = colors.base08 },
  DiffText = { fg = colors.base0D },
  DiffAdded = { link = 'DiffAdd' },
  DiffChanged = { link = 'DiffChange' },
  DiffRemoved = { link = 'DiffDelete' },
  Added = { link = 'DiffAdd' },
  Changed = { link = 'DiffChange' },
  Removed = { link = 'DiffDelete' },
  -- Spelling highlighting
  SpellBad = { sp = colors.base08, undercurl = true },
  SpellLocal = { sp = colors.base0C, undercurl = true },
  SpellCap = { sp = colors.base0D, undercurl = true },
  SpellRare = { sp = colors.base0E, undercurl = true },

  DiagnosticError = { fg = colors.base08 },
  DiagnosticWarn = { fg = colors.base0E },
  DiagnosticInfo = { fg = colors.base0D },
  DiagnosticHint = { fg = colors.base0C },
  DiagnosticDefaultError = { link = 'DiagnosticError' },
  DiagnosticDefaultHint = { link = 'DiagnosticHint' },
  DiagnosticDefaultInfo = { link = 'DiagnosticInfo' },
  DiagnosticDefaultWarn = { link = 'DiagnosticWarn' },
  DiagnosticFloatingError = { link = 'DiagnosticError' },
  DiagnosticFloatingHint = { link = 'DiagnosticHint' },
  DiagnosticFloatingInfo = { link = 'DiagnosticInfo' },
  DiagnosticFloatingWarn = { link = 'DiagnosticWarn' },
  DiagnosticSignError = { link = 'DiagnosticError' },
  DiagnosticSignHint = { link = 'DiagnosticHint' },
  DiagnosticSignInfo = { link = 'DiagnosticInfo' },
  DiagnosticSignWarn = { link = 'DiagnosticWarn' },
  DiagnosticUnderlineError = { sp = colors.base08, undercurl = true },
  DiagnosticUnderlineHint = { sp = colors.base0C, undercurl = true },
  DiagnosticUnderlineInfo = { sp = colors.base0F, undercurl = true },
  DiagnosticUnderlineWarn = { sp = colors.base0E, undercurl = true },

  LspReferenceText = { bg = colors.base04, underline = true },
  LspReferenceRead = { bg = colors.base04, underline = true },
  LspReferenceWrite = { bg = colors.base04, underline = true },

  -- Treesitter support

  TSAnnotation = { fg = colors.base0F },
  TSAttribute = { fg = colors.base0A },
  TSBoolean = { fg = colors.base09 },
  TSCharacter = { fg = colors.base08 },
  TSComment = { fg = colors.base03, italic = true },
  TSConstructor = { fg = colors.base0D },
  TSConditional = { fg = colors.base0E },
  TSConstant = { fg = colors.base09 },
  TSConstBuiltin = { fg = colors.base09, italic = true },
  TSConstMacro = { fg = colors.base08 },
  TSError = { fg = colors.base08 },
  TSException = { fg = colors.base08 },
  TSField = { fg = colors.base05 },
  TSFloat = { fg = colors.base09 },
  TSFunction = { fg = colors.base0D },
  TSFuncBuiltin = { fg = colors.base0D, italic = true },
  TSFuncMacro = { fg = colors.base08 },
  TSInclude = { fg = colors.base0D },
  TSKeyword = { fg = colors.base0E },
  TSKeywordFunction = { fg = colors.base0E },
  TSKeywordOperator = { fg = colors.base0E },
  TSLabel = { fg = colors.base0A },
  TSMethod = { fg = colors.base0D },
  TSNamespace = { fg = colors.base08 },
  TSNone = { fg = colors.base05 },
  TSNumber = { fg = colors.base09 },
  TSOperator = { fg = colors.base05 },
  TSParameter = { fg = colors.base05 },
  TSParameterReference = { fg = colors.base05 },
  TSProperty = { fg = colors.base05 },
  TSPunctDelimiter = { fg = colors.base0F },
  TSPunctBracket = { fg = colors.base05 },
  TSPunctSpecial = { fg = colors.base0F },
  TSRepeat = { fg = colors.base0E },
  TSString = { fg = colors.base0B },
  TSStringRegex = { fg = colors.base0C },
  TSStringEscape = { fg = colors.base0C },
  TSSymbol = { fg = colors.base0B },
  TSTag = { fg = colors.base08 },
  TSTagDelimiter = { fg = colors.base0F },
  TSText = { fg = colors.base05 },
  TSEmphasis = { fg = colors.base09, italic = true },
  TSUnderline = { fg = colors.base00, underline = true },
  TSStrike = { fg = colors.base00, strikethrough = true },
  TSTitle = { fg = colors.base0D },
  TSLiteral = { fg = colors.base09 },
  TSURI = { fg = colors.base09, underline = true },
  TSType = { fg = colors.base0A },
  TSTypeBuiltin = { fg = colors.base0A },
  TSVariable = { fg = colors.base08 },
  TSVariableBuiltin = { fg = colors.base08, italic = true },

  TSDefinition = { fg = nil, bg = nil },
  TSDefinitionUsage = { fg = nil, bg = nil },
  TSCurrentScope = { fg = nil, bg = nil, bold = true },

  LspInlayHint = { fg = colors.base03, bg = nil, sp = nil, italic = true },

  NvimInternalError = { link = 'ErrorMsg' },

  NormalFloat = { fg = colors.base05, bg = 'NONE' },
  FloatBorder = { fg = colors.base05, bg = colors.base00 },
  NormalNC = { fg = colors.base05, bg = colors.base00 },

  TreesitterContext = { bg = colors.base01 },
}

local transparent_backgrounds = {
  FloatBorder = true,
  Folded = true,
  NormalFloat = true,
  Normal = true,
  NormalNC = true,
  Pmenu = true,
  PmenuKind = true,
  SignColumn = true,
  StatusLine = true,
  StatusLineNC = true,
  TabLine = true,
  TabLineFill = true,
  TabLineSel = true,
}

-- Apply all highlight groups
for group, highlight in pairs(highlights) do
  if config.transparent and transparent_backgrounds[group] ~= nil then
    highlight.bg = 'NONE'
  end

  -- Set the highlight group
  vim.api.nvim_set_hl(0, group, highlight)
end
