<h1 align="center">TeVim</h1>

<div align="center">

![GitHub top language](https://img.shields.io/github/languages/top/sownteedev/TeVim?color=6d92bf&style=for-the-badge&labelColor=111418)
![Last Commit](https://img.shields.io/github/last-commit/sownteedev/TeVim?&style=for-the-badge&color=da696f&logoColor=D9E0EE&labelColor=111418)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/sownteedev/TeVim?color=e1b56a&style=for-the-badge&labelColor=111418)
![GitHub Repo stars](https://img.shields.io/github/stars/sownteedev/TeVim?color=74be88&style=for-the-badge&labelColor=111418)

</div>

<img src="https://github.com/sownteedev/TeVim/assets/90148193/48251bcf-864a-41e5-8c37-1418effcc662">

<div align="center">

```txt
Performance for time startup on low laptop
On Power                              : 0.035s - 0.039s
On Battery                            : 0.037s - 0.040s
```

</div>
<h5> Themes Showcase with 16 colorschemes </h5>

| <img src="https://github.com/sownteedev/TeVim/assets/90148193/7b5e73eb-244c-48b0-937a-bd9590ca151c" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/0dad550e-08f0-4ed3-a0a5-b8ace6e561d2" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/a3f2a5ab-e17f-4132-9c52-7ea8b0962ab8" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/ed8f0347-b809-4570-b0d9-6b49e81257d9" align="center" width="200px"> |
| :-------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------: | --------------------------------------------------------------------------------------------------------------------------------- |
| <img src="https://github.com/sownteedev/TeVim/assets/90148193/a7426bf0-43cd-4eb5-943c-7995b23a5b4b" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/49100402-f82c-40e3-9197-debdc04a0e54" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/7ec88e9b-5e40-475c-b765-82cc83571dd5" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/2148b26a-b799-426b-89ec-5ceda8a1006b" align="center" width="200px"> |
| <img src="https://github.com/sownteedev/TeVim/assets/90148193/c4fe9259-0714-4247-8c95-9cec37c0c697" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/073d64fd-f049-43a4-903d-6fde8ab1fbe3" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/a77bc174-cc25-4610-9c58-32590ad8c577" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/2ff7f908-51e7-4214-9609-9c4b72da8f90" align="center" width="200px"> |
| <img src="https://github.com/sownteedev/TeVim/assets/90148193/c9bc8b70-1912-4700-8f8c-928493189805" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/974c9cec-5479-49a1-9d37-05e82749ac97" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/eabb7fba-1596-44ec-b93c-98fb2244c911" align="center" width="200px"> | <img src="https://github.com/sownteedev/TeVim/assets/90148193/f7502d7c-fe4b-4970-899c-d32cd83bec73" align="center" width="200px"> |

</details>

## 🔎 Requirements

- Neovim >= v0.9.4.

- Nerd Font as your terminal font.

- Ripgrep and Fzf are required for grep searching with Telescope.

- GCC (Clang), Windows users must have mingw installed and set on path.

- Npm(neovim) and Pynvim for Neovim.

- Lazygit and Ranger (OPTIONAL).

- Xsel and Xclip for copy and paste (If you use X11)(OPTIONAL).

## ⬇️  Installation

- Backup your config
  ```zsh
  mv ~/.config/nvim ~/.config/nvim.bak
  ```
- Remove cache setup
  ```zsh
  rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim ~/.config/nvim/lazy-lock.json
  ```
- Install TeVim
  ```zsh
  git clone https://github.com/sownteedev/TeVim ~/.config/nvim --depth 1 && nvim
  ```

### Adding Mason to path
```zsh
# this is for zsh
export PATH=$PATH:~/.local/share/nvim/mason/bin
```

### Custom Colorschemes
> Read my colorschemes in tevim/themes/schemes/ and write like it in custom/themes/schemes/

### TeVim Commands
> **TeVimThemes** : Open list colorschemes
>
> **TeVimToggleTrans** : Toggle Transparency
>
> **TeVimCheckMason** : Install or Remove package you add or remove on custom/configs/overrides.lua

<br>

<h5> ENJOY WITH TEVIM ! 🎉 </h5>

<br>

> **NOTE:**
>
> TeVim auto create Custom Folder, change or add everything in it.
>
> THIS IS NOT A "DISTRO" and not for BEGINNERS, you need to have some experiences with Lua and Neovim.
>
> If there are any errors or questions, please create Issues or contact me
<a href="https://discordapp.com/users/745732774027198554">here</a>

## Plugins

| Plugin                                                                                | Description                                                    |  Lazy   |
| ------------------------------------------------------------------------------------- | -------------------------------------------------------------- | :-----: |
| [folke/lazy](https://github.com/folke/lazy.nvim)                                      | the package manager for newbies                                | `false` |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | syntax highlighting, most popular one for neovim               | `true`  |
| [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)             | highlights colors and is really frickin fast                   | `true`  |
| [nvim-neo-tree/neo-tree.lua](https://github.com/nvim-neo-tree/neo-tree.nvim)          | a very neat, simple and clean file tree and most features      | `true`  |
| [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)         | more devicons for neovim                                       | `true`  |
| [folke/which-key.nvim](https://github.com/folke/which-key.nvim)                       | shows all the posiible vim keybindings, perfect for dummies    | `true`  |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)     | probably the most popular menu. can be used for a lot of stuff | `true`  |
| [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)                 | terminal integration in neovim                                 | `true`  |
| [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                 | Super fast git decorations implemented purely in Lua.          | `true`  |
| [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)                 | installing LSPs made super easy                                | `true`  |
| [nvimdev/lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)                       | responsible for the winbar and lightbulb                       | `true`  |
| [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)                     | folds in neovim arent that bad! actually, better than vscode   | `true`  |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)                               | very simple and easy to use snippet engine                     | `true`  |
| [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)                     | quik and easy commenting                                       | `true`  |
| [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)               | beautiful highlights for TODO comments                         | `true`  |

## Keybinds

| Keys        | Function          |
| ------------- |-------------|
| <kbd>CTRL</kbd> <kbd>h</kbd> / <kbd>j</kbd> / <kbd>k</kbd> / <kbd>l</kbd> | Moving Window Focus Towards Left/Up/Down/Right (Normal) |
| <kbd>CTRL</kbd> <kbd>h</kbd> / <kbd>j</kbd> / <kbd>k</kbd> / <kbd>l</kbd> | Moving Cursor Left/Up/Down/Right (Insert) |
| <kbd>Enter</kbd> | Clear Highlights Search |
| <kbd>ALT</kbd> / <kbd>⬇️</kbd> / <kbd>⬆️</kbd> | Moving Current Line or Lines Down/Up |
| <kbd>CTRL</kbd> <kbd>e</kbd> | Toggle Explorer with Neotree |
| <kbd>CTRL</kbd> <kbd>`</kbd> | Open And Close ToggleTerm |

#### File Operations

| Keys        | Function          |
| ------------- |-------------|
| <kbd>LDR</kbd> <kbd>q</kbd> | Exit Neovim |
| <kbd>LDR</kbd> <kbd>q</kbd> <kbd>w</kbd> | Save And Exit Neovim |
| <kbd>CTRL</kbd> <kbd>s</kbd> | Save File (Normal + Insert) |
| <kbd>CTRL</kbd> <kbd>q</kbd> | Close Current Buffer |
| <kbd>CTRL</kbd> <kbd>o</kbd> | Close Other Buffer |

#### Telescope

| Keys        | Function          |
| ------------- |-------------|
| <kbd>LDR</kbd> <kbd>f</kbd> <kbd>f</kbd>  | Find Files |
| <kbd>LDR</kbd> <kbd>f</kbd> <kbd>r</kbd> | Find Recently Visited Files |
| <kbd>LDR</kbd> <kbd>f</kbd> <kbd>w</kbd> | Find File By String |
| <kbd>LDR</kbd> <kbd>f</kbd> <kbd>t</kbd> | TODO |
| <kbd>LDR</kbd> <kbd>f</kbd> <kbd>c</kbd> | TeVim Colorscheme Picker |

#### LSP

| Keys        | Function          |
| ------------- |-------------|
| <kbd>LDR</kbd> <kbd>l</kbd> <kbd>i</kbd>  | Toggle Inlay Hints |
| <kbd>LDR</kbd> <kbd>l</kbd> <kbd>a</kbd>  | Code Action |
| <kbd>LDR</kbd> <kbd>l</kbd> <kbd>o</kbd>  | Outline |
| <kbd>LDR</kbd> <kbd>l</kbd> <kbd>i</kbd>  | Lsp Infor |
| <kbd>LDR</kbd> <kbd>l</kbd> <kbd>r</kbd>  | Lsp Rename |

#### Treesiiter

| Keys        | Function          |
| ------------- |-------------|
| <kbd>LDR</kbd> <kbd>s</kbd> <kbd>c</kbd>  | Toggle Context |
| <kbd>LDR</kbd> <kbd>s</kbd> <kbd>i</kbd> | Treesiiter Info |
| <kbd>LDR</kbd> <kbd>s</kbd> <kbd>u</kbd> | Treesiiter Update |

#### Lazy

| Keys        | Function          |
| ------------- |-------------|
| <kbd>LDR</kbd> <kbd>p</kbd> <kbd>S</kbd>  | Open Lazy Dashboard |
| <kbd>LDR</kbd> <kbd>p</kbd> <kbd>s</kbd>  | Lazy Sync |
| <kbd>LDR</kbd> <kbd>p</kbd> <kbd>i</kbd>  | Lazy Install |
| <kbd>LDR</kbd> <kbd>p</kbd> <kbd>u</kbd>  | Lazy Update |
| <kbd>LDR</kbd> <kbd>p</kbd> <kbd>C</kbd>  | Clean Plugins |
| <kbd>LDR</kbd> <kbd>p</kbd> <kbd>c</kbd>  | Open Lazy Log |

<br>

> Use **Space** to open which-key and use more keybindings

<br>

<details><summary> <b>Credits</b></summary>

- [Nvchad](https://github.com/nvchad) helped me with TeDash and TeBufline
- [chadcat7](https://github.com/chadcat7) helped me with Theme

</details>
