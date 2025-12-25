--
-- File name:
-- options.lua
--

-- Options globales
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.laststatus = 3
vim.opt.cmdheight = 3
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.scrolloff = 8           -- Garde 8 lignes visibles en haut/bas
vim.opt.updatetime = 50         -- Réduit le délai pour CursorHold
vim.opt.timeoutlen = 500        -- Délai d'attente pour les combinaisons de touches (important pour <Leader>gg)
vim.opt.wrap = false            -- Pas de retour à la ligne
vim.opt.swapfile = false        -- Désactive les swapfiles
vim.opt.backup = false          -- Désactive les backups
vim.opt.undofile = true         -- Active l'historique d'annulation persistant
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.hlsearch = false        -- Ne garde pas la recherche surlignée
vim.opt.incsearch = true        -- Recherche incrémentale
vim.opt.ignorecase = true       -- Ignore la casse dans la recherche
vim.opt.smartcase = true        -- Sauf si majuscule dans la recherche

-- Leader
vim.g.mapleader = " "

-- EOF

