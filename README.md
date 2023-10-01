<h1 align="center">TeVim</h1>

<h4 align="center">Neovim config by SownteeNguyen @sownteedev</h2>

<div align="center">
 
[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-Nightly-blueviolet.svg?style=for-the-badge&logo=Neovim&color=90E59A&logoColor=white)](https://github.com/neovim/neovim)
![](https://img.shields.io/github/last-commit/sownteedev/TeVim?&style=for-the-badge&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41)
![](https://img.shields.io/github/stars/sownteedev/TeVim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
[![](https://img.shields.io/github/repo-size/sownteedev/TeVim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)](https://github.com/sownteedev/TeVim)
<a href="https://discordapp.com/users/745732774027198554"><img src="https://img.shields.io/badge/Discord-7289DA?style=for-the-badge&logo=discord&logoColor=white"/></a>
</div>
  
## 📷 Showcase

<img src="screenshot/layout.png">
<img src="screenshot/syntax.png">

<h5> Themes Showcase </h5>

|    <img src="screenshot/ayu.png" align="center" width="200px">    | <img src="screenshot/catppuccin.png" align="center" width="200px"> |   <img src="screenshot/decay.png" align="center" width="200px">    | <img src="screenshot/decaydark.png" align="center" width="200px">    |
| :---------------------------------------------------------------: | :----------------------------------------------------------------: | :----------------------------------------------------------------: | -------------------------------------------------------------------- |
| <img src="screenshot/everblush.png" align="center" width="200px"> | <img src="screenshot/everforest.png" align="center" width="200px"> |  <img src="screenshot/dracula.png" align="center" width="200px">   | <img src="screenshot/github_light.png" align="center" width="200px"> |
|  <img src="screenshot/gruvbox.png" align="center" width="200px">  |  <img src="screenshot/onedark.png" align="center" width="200px">   | <img src="screenshot/oxocarbon.png" align="center" width="200px">  | <img src="screenshot/rosepine.png" align="center" width="200px">     |
| <img src="screenshot/solarized.png" align="center" width="200px"> | <img src="screenshot/tokyodark.png" align="center" width="200px">  | <img src="screenshot/tokyonight.png" align="center" width="200px"> | <img src="screenshot/yoru.png" align="center" width="200px">         |

</details>

## 🔌 UI related plugins used

<details><summary> <b>Images</b></summary>

<h4> Left Bar </h3>

<img src="screenshot/leftbar.png">

<h4> Find anything </h3>

<img src="screenshot/telescope.png">

<h4> Bufferline </h4>

<img src="screenshot/buffer.png">

<h4> Smart statusline </h3>

<img src="screenshot/statusline.png">

<h4> Bindkeys with Whichkey </h3>

<img src="screenshot/whichkeys.png">

</details>

## ⚙️ Plugins

- Mange plugins with [packer.nvim](https://github.com/wbthomason/packer.nvim)
- Many beautiful themes, theme toggle from [nvchad/base46](https://github.com/NvChad/base46)
- Buffer and Statusline with [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) & [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- File navigation with [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Beautiful and configurable icons with [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- Git diffs and more with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- NeoVim Lsp configuration with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) and [mason.nvim](https://github.com/williamboman/mason.nvim)
- Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- File searching, previewing image and text files and more with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
- Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Autoclosing braces and html tags with [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- Useful snippets with [friendly snippets](https://github.com/rafamadriz/friendly-snippets) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip).
- Popup mappings keysheet [whichkey.nvim](https://github.com/folke/which-key.nvim)
- Terminal with [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

and more plugins...
<br>

<h2>🔎 Requirement </h2>
- You probably notice you don't have support for copy and paste also that python and node haven't been setup
  
  - If you on X11 install xsel and xclip
    
    ```
    sudo pacman -S xsel xclip
    ```

- Next we need to install python support (Node is optional)
  - Neovim python support:
  ```
    pip install pynvim
  ```
  - Neovim Node support
  ```
    npm i -g neovim
  ```
- Other dependencies for formatting & finding text :

  - Prettier

  ```
    npm i -g prettier
  ```

  - Ripgrep Fzf Lazygit

  ```
    sudo pacman -S ripgrep fzf lazygit
  ```

<h2> ⬇️  Install </h2>

- Backup old config

  ```
  mv ~/.config/nvim ~/.config/nvim.bak
  ```

- Remove old plugins and setup

  ```
  rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim ~/.config/nvim/lazy-lock.json
  ```

- Install TeVim

  ```
  git clone https://github.com/sownteedev/TeVim ~/.config/nvim --depth 1 && nvim
  ```

- Wait for everything to install, reopen Neovim and ENJOY !

<details><summary> <b><i>Credits</b></i></summary>

- [Nvchad](https://github.com/nvchad/base46) helped me with NeoVim themes

</details>
