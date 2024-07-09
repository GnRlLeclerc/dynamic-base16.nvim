local base16 = require('dynamic-base16')

local config = base16.config

-- Reload the custom colors module if it is specified
if config.module ~= nil then
  package.loaded[config.module] = nil
  local colors = require(config.module)
  base16.set_colors(colors)
end

-- Load colors after having loaded the custom module
local colors = base16.colors

-- copied from RRethy/base16-nvim
-- inspired by rose-pine/neovim

-- Define the highlight groups
local highlights = {
  Normal       = { fg = colors.base05, bg = colors.base00 },
  Debug        = { fg = colors.base08 },
  Directory    = { fg = colors.base0D },
  Error        = { fg = colors.base08 },
  ErrorMsg     = { fg = colors.base08 },
  Exception    = { fg = colors.base08 },
  FoldColumn   = { fg = colors.base0C },
  Folded       = { fg = colors.base03 },
  CurSearch    = { fg = colors.base01, bg = colors.base0A },
  IncSearch    = { link = "CurSearch" },
  Macro        = { fg = colors.base08 },
  MatchParen   = { bg = colors.base03 },
  ModeMsg      = { fg = colors.base0B },
  MoreMsg      = { fg = colors.base0B },
  Question     = { fg = colors.base0D },
  Search       = { fg = colors.base01, bg = colors.base0A },
  Substitute   = { link = "CurSearch" },
  SpecialKey   = { fg = colors.base03 },
  Underlined   = { fg = colors.base08 },
  Visual       = { bg = colors.base02 },
  WarningMsg   = { fg = colors.base08 },
  WildMenu     = { link = "CurSearch" },
  Title        = { fg = colors.base0D },
  Conceal      = { bg = "NONE" },
  Cursor       = { fg = colors.base00, bg = colors.base05 },
  NonText      = { fg = colors.base03 },
  LineNr       = { fg = colors.base04 },
  SignColumn   = { fg = colors.base04, bg = "NONE" },
  StatusLine   = { fg = colors.base05, bg = colors.base02 },
  StatusLineNC = { fg = colors.base04, bg = colors.base01 },
  WinBar       = { fg = colors.base05 },
  WinBarNC     = { fg = colors.base04 },
  VertSplit    = { fg = colors.base05 },
  ColorColumn  = { bg = colors.base01 },
  CursorColumn = { bg = colors.base01 },
  CursorLine   = { bg = colors.base01 },
  CursorLineNr = { fg = colors.base04 },
  TabLine      = { fg = colors.base03, bg = colors.base01 },
  TabLineFill  = { bg = colors.base01 },
  TabLineSel   = { fg = colors.base0B, bg = colors.base01 },

  -- Standard syntax highlighting
  Boolean      = { fg = colors.base09 },
  Character    = { fg = colors.base08 },
  Comment      = { fg = colors.base03 },
  Conditional  = { fg = colors.base0E },
  Constant     = { fg = colors.base09 },
  Define       = { fg = colors.base0E, },
  Delimiter    = { fg = colors.base0F },
  Float        = { fg = colors.base09 },
  Function     = { fg = colors.base0D },
  Identifier   = { fg = colors.base08, },
  Include      = { fg = colors.base0D },
  Keyword      = { fg = colors.base0E },
  Label        = { fg = colors.base0A },
  Number       = { fg = colors.base09 },
  Operator     = { fg = colors.base0E, },
  PreProc      = { fg = colors.base0A },
  Repeat       = { fg = colors.base0A },
  Special      = { fg = colors.base0C },
  SpecialChar  = { fg = colors.base0F },
  Statement    = { fg = colors.base08 },
  StorageClass = { fg = colors.base0A },
  String       = { fg = colors.base0B },
  Structure    = { fg = colors.base0E },
  Tag          = { fg = colors.base0A },
  Todo         = { fg = colors.base0A, bg = colors.base01 },
  Type         = { fg = colors.base0A, },
  Typedef      = { fg = colors.base0A },

  -- Diff highlighting
  DiffAdd      = { fg = colors.base0B, bg = colors.base00 },
  DiffChange   = { fg = colors.base03, bg = colors.base00 },
  DiffDelete   = { fg = colors.base08, bg = colors.base00 },
  DiffText     = { fg = colors.base0D, bg = colors.base00 },
  DiffAdded    = { link = "DiffAdd" },
  DiffChanged  = { link = "DiffChange" },
  DiffRemoved  = { link = "DiffDelete" },

  -- Spelling highlighting
  SpellBad     = { sp = colors.base08, },
  SpellLocal   = { sp = colors.base0C },
  SpellCap     = { sp = colors.base0D },
  SpellRare    = { sp = colors.base0E },


  DiagnosticError          = { fg = colors.base08 },
  DiagnosticWarn           = { fg = colors.base0E },
  DiagnosticInfo           = { fg = colors.base0D },
  DiagnosticHint           = { fg = colors.base0C },
  DiagnosticDefaultError   = { link = "DiagnosticError" },
  DiagnosticDefaultHint    = { link = "DiagnosticHint" },
  DiagnosticDefaultInfo    = { link = "DiagnosticInfo" },
  DiagnosticDefaultWarn    = { link = "DiagnosticWarn" },
  DiagnosticFloatingError  = { link = "DiagnosticError" },
  DiagnosticFloatingHint   = { link = "DiagnosticHint" },
  DiagnosticFloatingInfo   = { link = "DiagnosticInfo" },
  DiagnosticFloatingWarn   = { link = "DiagnosticWarn" },
  DiagnosticSignError      = { link = "DiagnosticError" },
  DiagnosticSignHint       = { link = "DiagnosticHint" },
  DiagnosticSignInfo       = { link = "DiagnosticInfo" },
  DiagnosticSignWarn       = { link = "DiagnosticWarn" },
  DiagnosticUnderlineError = { sp = colors.base08 },
  DiagnosticUnderlineHint  = { sp = colors.base0C },
  DiagnosticUnderlineInfo  = { sp = colors.base0F },
  DiagnosticUnderlineWarn  = { sp = colors.base0E },

  LspReferenceText         = { bg = colors.base04 },
  LspReferenceRead         = { bg = colors.base04 },
  LspReferenceWrite        = { bg = colors.base04 },

  -- Treesitter support

  TSAnnotation             = { fg = colors.base0F, gui = 'none', },
  TSAttribute              = { fg = colors.base0A, gui = 'none', },
  TSBoolean                = { fg = colors.base09, gui = 'none', },
  TSCharacter              = { fg = colors.base08, gui = 'none', },
  TSComment                = { fg = colors.base03, gui = 'italic', },
  TSConstructor            = { fg = colors.base0D, gui = 'none', },
  TSConditional            = { fg = colors.base0E, gui = 'none', },
  TSConstant               = { fg = colors.base09, gui = 'none', },
  TSConstBuiltin           = { fg = colors.base09, gui = 'italic', },
  TSConstMacro             = { fg = colors.base08, gui = 'none', },
  TSError                  = { fg = colors.base08, gui = 'none', },
  TSException              = { fg = colors.base08, gui = 'none', },
  TSField                  = { fg = colors.base05, gui = 'none', },
  TSFloat                  = { fg = colors.base09, gui = 'none', },
  TSFunction               = { fg = colors.base0D, gui = 'none', },
  TSFuncBuiltin            = { fg = colors.base0D, gui = 'italic', },
  TSFuncMacro              = { fg = colors.base08, gui = 'none', },
  TSInclude                = { fg = colors.base0D, gui = 'none', },
  TSKeyword                = { fg = colors.base0E, gui = 'none', },
  TSKeywordFunction        = { fg = colors.base0E, gui = 'none', },
  TSKeywordOperator        = { fg = colors.base0E, gui = 'none', },
  TSLabel                  = { fg = colors.base0A, gui = 'none', },
  TSMethod                 = { fg = colors.base0D, gui = 'none', },
  TSNamespace              = { fg = colors.base08, gui = 'none', },
  TSNone                   = { fg = colors.base05, gui = 'none', },
  TSNumber                 = { fg = colors.base09, gui = 'none', },
  TSOperator               = { fg = colors.base05, gui = 'none', },
  TSParameter              = { fg = colors.base05, gui = 'none', },
  TSParameterReference     = { fg = colors.base05, gui = 'none', },
  TSProperty               = { fg = colors.base05, gui = 'none', },
  TSPunctDelimiter         = { fg = colors.base0F, gui = 'none', },
  TSPunctBracket           = { fg = colors.base05, gui = 'none', },
  TSPunctSpecial           = { fg = colors.base0F, gui = 'none', },
  TSRepeat                 = { fg = colors.base0E, gui = 'none', },
  TSString                 = { fg = colors.base0B, gui = 'none', },
  TSStringRegex            = { fg = colors.base0C, gui = 'none', },
  TSStringEscape           = { fg = colors.base0C, gui = 'none', },
  TSSymbol                 = { fg = colors.base0B, gui = 'none', },
  TSTag                    = { fg = colors.base08, gui = 'none', },
  TSTagDelimiter           = { fg = colors.base0F, gui = 'none', },
  TSText                   = { fg = colors.base05, gui = 'none', },
  TSEmphasis               = { fg = colors.base09, gui = 'italic', },
  TSUnderline              = { fg = colors.base00, gui = 'underline', },
  TSStrike                 = { fg = colors.base00, gui = 'strikethrough', },
  TSTitle                  = { fg = colors.base0D, gui = 'none', },
  TSLiteral                = { fg = colors.base09, gui = 'none', },
  TSURI                    = { fg = colors.base09, gui = 'underline', },
  TSType                   = { fg = colors.base0A, gui = 'none', },
  TSTypeBuiltin            = { fg = colors.base0A, gui = 'italic', },
  TSVariable               = { fg = colors.base08, gui = 'none', },
  TSVariableBuiltin        = { fg = colors.base08, gui = 'italic', },

  TSDefinition             = { fg = nil, bg = nil, gui = 'underline', },
  TSDefinitionUsage        = { fg = nil, bg = nil, gui = 'underline', },
  TSCurrentScope           = { fg = nil, bg = nil, gui = 'bold', },

  LspInlayHint             = { fg = colors.base03, bg = nil, gui = 'italic', sp = nil },


  -- TODO : la suite
  NvimInternalError = { link = "ErrorMsg" },

  NormalFloat       = { fg = colors.base05, bg = "NONE" },
  -- TODO : border is NONE if transparency
  FloatBorder       = { fg = colors.base05, bg = colors.base00 },
  NormalNC          = { fg = colors.base05, bg = colors.base00 },

  TreesitterContext = { bg = colors.base01 },
}

-- Apply all highlight groups
for group, highlight in pairs(highlights) do
  -- Resolve links to other highlight groups
  while highlight.link ~= nil do
    highlight = highlights[highlight.link] or {}
  end

  -- Set the highlight group
  vim.api.nvim_set_hl(0, group, highlight)
end
