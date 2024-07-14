--- @class Config
--- @field module string?
--- @field transparent boolean?
--- @field watch boolean | string?

--- @class Colors
--- @field base00 string?
--- @field base01 string?
--- @field base02 string?
--- @field base03 string?
--- @field base04 string?
--- @field base05 string?
--- @field base06 string?
--- @field base07 string?
--- @field base08 string?
--- @field base09 string?
--- @field base0A string?
--- @field base0B string?
--- @field base0C string?
--- @field base0D string?
--- @field base0E string?
--- @field base0F string?

--- @class DynamicBase16
--- @field config Config
--- @field colors Colors
local M = {
  colors = {
    -- Default colors: Atom One Dark
    base00 = '#282c34',
    base01 = '#353b45',
    base02 = '#3e4451',
    base03 = '#545862',
    base04 = '#565c64',
    base05 = '#abb2bf',
    base06 = '#b6bdca',
    base07 = '#c8ccd4',
    base08 = '#e06c75',
    base09 = '#d19a66',
    base0A = '#e5c07b',
    base0B = '#98c379',
    base0C = '#56b6c2',
    base0D = '#61afef',
    base0E = '#c678dd',
    base0F = '#be5046',
  },
}

-- Setup the Dynamic Base16 color scheme
--- @param config Config?
function M.setup(config)
  -- Store the config in the module
  M.config = vim.tbl_extend('force', M, config or {})

  -- Set the color scheme
  vim.cmd('colorscheme dynamic-base16')

  -- DEBUG
  vim.notify(string.format('%s %s', config.watch, config.module))

  -- If setup, watch the color module and reapply theme on changes
  if config and config.watch and config.module then
    --- @type string
    --- @diagnostic disable-next-line: assign-type-mismatch
    local path = type(config.watch) == 'string' and config.watch
      or string.format('/home/thibaut/.config/nvim/lua/%s.lua', config.module)
    vim.notify(string.format('watching path %s', path))

    local callback = function()
      -- Reset the color theme on change
      vim.cmd('colorscheme dynamic-base16')
    end

    require('dynamic-base16.fs_watch').watch(path, callback)
  end
end

-- Set custom colors for the color scheme
--- @param colors Colors
function M.set_colors(colors)
  M.colors = vim.tbl_extend('force', M.colors, colors)
end

return M
