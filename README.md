# Ash

A simple, elegant, and dark theme for Neovim.

<p align="center">
  <img src="theme.png" alt="Ash Theme Preview">
</p>

>A whisper soft, a final sigh,  
>Of embers fading, where flames danced high.  
>A silver ghost on the hearthstone laid,  
>A memory of the fire's parade.  
>This is the ash, the soft and grey,  
>The quiet end of a burning day.

## Installation

Install with your favorite plugin manager.

### lazy.nvim

Add the following to your `lazy.nvim` configuration:

```lua
{
  "bjarneo/ash.nvim",
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme ash]])
  end,
}
```

## Usage

To use the theme, add the following to your `init.lua`:

```lua
vim.cmd.colorscheme "ash"
```

