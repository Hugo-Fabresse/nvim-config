# 🌙 Nihil.nvim

Configuration Neovim moderne, minimaliste et cohérente.

## 📦 Installation
```bash
git clone https://github.com/USERNAME/nihil.nvim.git ~/.config/nvim
nvim
```

Packer s'installera automatiquement au premier lancement. Exécute ensuite `:PackerSync` pour installer les plugins.

## ⚡ Fonctionnalités

- **UI** : Tokyo Night, Lualine, Bufferline, Edgy
- **Explorer** : NvimTree, Telescope File Browser
- **Git** : Fugitive, LazyGit, Gitsigns, Blamer
- **LSP** : Mason (lua_ls, pyright, ts_ls, rust_analyzer, clangd)
- **Complétion** : nvim-cmp + LuaSnip
- **Syntax** : Treesitter

## 🗂️ Structure
```
~/.config/nvim/
├── init.lua              # Point d'entrée
└── lua/
    ├── nihil/           # Modules de configuration
    └── snippets/        # Snippets LuaSnip
```

## ⌨️ Keybindings principaux

- `<Space>` : Leader key
- `<Tab>` / `<S-Tab>` : Navigation buffers
- `<Leader>e` : NvimTree
- `<Leader>p` : Telescope file browser
- `<Leader>gg` : LazyGit
