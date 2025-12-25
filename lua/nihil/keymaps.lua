--
-- File name:
-- keymaps.lua
--

-- Sauvegarde rapide
vim.keymap.set({'n','i'}, '<C-s>', '<Esc>:w<CR>a', { silent = true, noremap = true })
-- Quitter avec Leader
vim.keymap.set('n','<Leader>q', ':qa<CR>', { silent = true, noremap = true })
-- Splits
vim.keymap.set('n','<Leader>sv',':vsplit<CR>',{ silent=true, noremap=true })
vim.keymap.set('n','<Leader>sh',':split<CR>',{ silent=true, noremap=true })
vim.keymap.set('n','<Leader>sc',':close<CR>',{ silent=true, noremap=true })
-- Navigation splits
vim.keymap.set('n','<C-h>','<C-w>h',{ silent=true, noremap=true })
vim.keymap.set('n','<C-j>','<C-w>j',{ silent=true, noremap=true })
vim.keymap.set('n','<C-k>','<C-w>k',{ silent=true, noremap=true })
vim.keymap.set('n','<C-l>','<C-w>l',{ silent=true, noremap=true })
-- Messages
vim.keymap.set('n','<Leader>m',':messages<CR>',{ silent=true, noremap=true })
-- Telescope
local function open_file_tree()
    require("telescope").extensions.file_browser.file_browser({
        path = vim.loop.cwd(),
        cwd = vim.loop.cwd(),
        grouped = true,
        hidden = true,
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.7,
            height = 0.7,
            preview_width = 0.5,
            prompt_position = "top",
        },	
    })
end

vim.keymap.set('n', '<Leader>p', open_file_tree, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>f', function()
    require('telescope.builtin').live_grep({ cwd = vim.loop.cwd() })
end, { noremap = true, silent = true })
-- Déplacer lignes en mode visuel
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", {silent=true})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {silent=true})
-- Garder le curseur centré lors de navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz', {silent=true})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {silent=true})
vim.keymap.set('n', 'n', 'nzzzv', {silent=true})
vim.keymap.set('n', 'N', 'Nzzzv', {silent=true})
-- Copier dans le clipboard système
vim.keymap.set({'n','v'}, '<Leader>y', '"+y', {silent=true})
-- Recherche Telescope
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>', {silent=true})
vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<CR>', {silent=true})
vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<CR>', {silent=true})

-- EOF

