-- Lualine theme

local base16 = require('dynamic-base16')

--- @type Colors
local colors = base16.colors

-- Taken from the lualine base16 theme
return {
  bg = colors.base01,
  alt_bg = colors.base02,
  dark_fg = colors.base03,
  fg = colors.base04,
  light_fg = colors.base05,
  normal = colors.base0D,
  insert = colors.base0B,
  visual = colors.base0E,
  replace = colors.base09,
}
