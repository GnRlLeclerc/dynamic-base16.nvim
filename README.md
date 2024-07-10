# 🎨 Dynamic Base16

Dynamic Base16 is a minimal base16-based theme for neovim that relies on external color definitions. It was made to be used with tools like [Flavours](https://github.com/Misterio77/flavours) for live theme hopping. No prebuilt themes are included. Tested on Linux only.

It is based on the [base16-nvim](https://github.com/RRethy/base16-nvim/tree/master) theme, with inspirations from [onedark.nvim](https://github.com/navarasu/onedark.nvim).

## Installation

Using `lazy.nvim`:

```lua
return {
  'GnRlLeclerc/dynamic-base16.nvim',
  config = function()
    require('dynamic-base16').setup()
  end
}
```

## Usage

This theme is primarily intended to be used with base16 theme generators such as [Flavours](https://github.com/Misterio77/flavours). When setup with the `module = 'your_colors'` option, it will try to load the colors from the `'your_colors'` lua module, which must be available in the lua runtimepath.

Here is a minimal configuration example for Flavours:

`~/.config/flavours/config.toml`

```toml
[[items]]
file = "~/.config/nvim/lua/base16_colors.lua"
template = "luakit"
subtemplate = "colors"
rewrite = true
hook = "nvim-reload-scheme"  # See live reloading section
```

### Live reloading

The colorscheme can be live reloaded when running flavours. You must install the [`neovim-remote`](https://pypi.org/project/neovim-remote/) python package first.

`~/.local/bin/nvim-reload-scheme`

```bash
#!/usr/bin/env bash

nvr --serverlist |
  while read line; do
    nvr --nostart -cc ':colorscheme dynamic-base16' --servername $line &
  done
```

When Flavours is run, this hook will be called, reloading the `dynamic-base16` color scheme in all running neovim instances.

Try running `flavours apply onedark` !

## Configuration

The theme can be configured like so:

```lua
return {
  'GnRlLeclerc/dynamic-base16.nvim',
  config = function()
    require('dynamic-base16').setup({
      module = 'base16_colors',  -- default: nil
      transparent = false,  -- Transparent background
    })
  end
}
```

The colors can be set manually. However, `module` takes precedence over them if present.

```lua
require('dynamic-base16').set_colors({
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
})

```
