# nvim-webicons

A Neovim plugin for managing and displaying custom icons in your editor.

## Installation

### Using `lazy.nvim`

```lua
{
  "Hugo1974/nvim-webicons",
  config = function()
    require("nvim-webicons").setup()
  end
}
```

### Using `packer.nvim`

```lua
use {
  "Hugo1974/nvim-webicons",
  config = function()
    require("nvim-webicons").setup()
  end
}
```

### Using `vim-plug`

```vim
Plug 'Hugo1974/nvim-webicons'
```

After installing, add the following to your `init.lua` or `init.vim`:

```lua
require("nvim-webicons").setup()
```

## User Configuration

User configuration should be placed in:

```
nvim/lua/config/nvim-webicons.lua
```

### Example Configuration

Create the file `nvim/lua/config/nvim-webicons.lua` and add:

```lua
return {
  data = {
    ["🌺 flores"] = {
      rosa = "🌹",  -- Rose icon
      lirio = "🌸",  -- Lily icon
      tulipan = "🌷",  -- Tulip icon
    },
    ["🌵 cactus"] = {
      cactus1 = "🌵",  -- Cactus icon
      cactus2 = "🪴",  -- Another cactus icon
    },
  },
}
```

This will extend the existing icon set with custom user-defined icons.

And add to config/init.lua this lines:

```
local user_config = require("config.nvim-webicons") -- Load user config
require("nvim-webicons").setup(user_config) -- Apply user config

```


## Usage

Once installed and configured, the icons will be available for use in your Neovim setup.

For any issues, feel free to open an issue or contribute to the project!
