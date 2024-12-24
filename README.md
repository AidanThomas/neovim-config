This is my configuration for Neovim. It includes plugins to try and make it useful for programming/text editing in any language.
I try to create the configuration in a way that it can be completely portable, so that I can use the same configuration wherever I need to. This being said, this configuration is mostly untested on Windows and so it may not work flawlessly on there. 

# Installation
Requires `Neovim v0.10.0+`

Simply clone the repo to your `~/.config` folder or wherever you want to drive your configuration from. You only need to use one of the following commands.

## Using SSH
```bash
cd ~/.config
git clone git@github.com:AidanThomas/neovim-config
```

## Using HTTPS
```bash
cd ~/.config
git clone https://github.com/AidanThomas/neovim-config
```

Then run neovim and [Lazy](https://github.com/folke/lazy.nvim) should download the plugins necessary for running this config.

# Usage
While most plugins should and will work out of the box, there are a couple notable exceptions:

## Language servers
You need to manually install language servers and potentially set up their config using [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig). To install a language server you can either download the binaries manually, or you can use the `:Mason` command to browse and install Language servers, debuggers, Linters and Formatters. Once you have done that, you will need to add the configuration to allow neovim to talk to the language server. Most of the time this can be done by editing the `opts` table found in `./lua/plugins.lua`. You can find the details for how to configure various language servers [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md), or by using the command `:help lspconfig-all` inside of Neovim.

You could edit `./lua/plugins.lua` to look something like:
```lua
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                cmd = "Mason",
                build = function()
                    pcall(vim.cmd.MasonUpdate)
                end,
                config = function()
                    require("config.plugins.mason")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },
        },
        opts = {
            servers = {
                your_server = {},
                your_other_server = {
                    -- add any extra configuration that you want here
                },
            }
        },
        config = function(_, opts)
            require "config.plugins.lsp".setup(opts)
        end
    },
```

## Formatters
This config uses [conform.nvim](https://github.com/stevearc/conform.nvim) to apply various formatters. Once you download a formatter either manually or through `:Mason`, you need to tell conform about it by adding configuration to `./lua/config/plugins/conform.lua`. This is fairly straightforward and typically will just require adding `language = { 'formatter' }` to the `formatters_by_ft` table in that file.

Having a formatter for each language is not always required, as conform will automatically fallback to using whatever LSP you have installed.
