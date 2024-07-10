-- Lualine theme

local base16 = require('dynamic-base16')

--- @type Colors
local colors = base16.colors

-- Taken from the lualine base16 theme
local function setup(colors)
  local theme = {
    normal = {
      a = { fg = colors.bg, bg = colors.normal },
      b = { fg = colors.light_fg, bg = colors.alt_bg },
      c = { fg = colors.fg, bg = colors.bg },
    },
    replace = {
      a = { fg = colors.bg, bg = colors.replace },
      b = { fg = colors.light_fg, bg = colors.alt_bg },
    },
    insert = {
      a = { fg = colors.bg, bg = colors.insert },
      b = { fg = colors.light_fg, bg = colors.alt_bg },
    },
    visual = {
      a = { fg = colors.bg, bg = colors.visual },
      b = { fg = colors.light_fg, bg = colors.alt_bg },
    },
    inactive = {
      a = { fg = colors.dark_fg, bg = colors.bg },
      b = { fg = colors.dark_fg, bg = colors.bg },
      c = { fg = colors.dark_fg, bg = colors.bg },
    },
  }

  theme.command = theme.normal
  theme.terminal = theme.insert

  return theme
end

return setup({
  bg = colors.base01,
  alt_bg = colors.base02,
  dark_fg = colors.base03,
  fg = colors.base04,
  light_fg = colors.base05,
  normal = colors.base0D,
  insert = colors.base0B,
  visual = colors.base0E,
  replace = colors.base09,
})
