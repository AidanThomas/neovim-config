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
You need to manually install language servers and set up their config. To install a language server you can either download the binaries manually, or you can use the `:Mason` command to browse and install Language servers, debuggers, Linters and Formatters. Once you have done that, you will need to add the configuration to allow neovim to talk to the language server. This can be done by editing the `servers` table found in `./lua/config/plugins/lsp.lua`. If you don't know where to start, [lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md), has some documentation. I would recommend looking at the source to see the default options for whichever server you want to configure.

You could edit `servers` in `./lua/config/plugins/lsp.lua` to look something like:
```lua
    local servers = {
        your_language_server = {
            cmd = { "command_to_start" },
            root_markers = { "filename_found_in_root"},
            filetypes = {"filetype_you_want_to_attach_the_lsp_to"}
        },
        your_other_language_server = {
            ...
        },
    }
```

## Formatters
This config uses [conform.nvim](https://github.com/stevearc/conform.nvim) to apply various formatters. Once you download a formatter either manually or through `:Mason`, you need to tell conform about it by adding configuration to `./lua/config/plugins/conform.lua`. This is fairly straightforward and typically will just require adding `language = { 'formatter' }` to the `formatters_by_ft` table in that file.

Having a formatter for each language is not always required, as conform will automatically fallback to using whatever LSP you have installed.
