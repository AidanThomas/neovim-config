# Installation

Clone this repository to your ~/.config/nvim directory
```
git clone git@github.com:AidanThomas/neovim-config.git ~/.config/nvim
```

Grab [packer.nvim](https://github.com/wbthomason/packer.nvim) from their git repo
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Open neovim and source the file `lua/core/packer.lua` and then run `:PackerSync`
