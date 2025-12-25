--
-- File name:
-- gitsigns.lua
--

local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then return end

gitsigns.setup({
    signs = {
        add          = { text = '▎' },
        change       = { text = '▎' },
        delete       = { text = '' },
        topdelete    = { text = '' },
        changedelete = { text = '▎' },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false,
})

-- ============================================================
-- GITSIGNS - Navigation et actions sur les hunks (modifications)
-- ============================================================

-- Preview hunk (voir les modifications)
vim.keymap.set('n', '<Leader>gp', ':Gitsigns preview_hunk<CR>', {
    silent = true,
    noremap = true,
    desc = "Preview hunk"
})

-- Blame de la ligne courante
vim.keymap.set('n', '<Leader>gb', ':Gitsigns blame_line<CR>', {
    silent = true,
    noremap = true,
    desc = "Blame line"
})

-- Navigation entre les hunks
vim.keymap.set('n', '<Leader>gn', ':Gitsigns next_hunk<CR>', {
    silent = true,
    noremap = true,
    desc = "Next hunk"
})

vim.keymap.set('n', '<Leader>gN', ':Gitsigns prev_hunk<CR>', {
    silent = true,
    noremap = true,
    desc = "Previous hunk"
})

-- Stage hunk (ajouter les modifications)
vim.keymap.set('n', '<Leader>ga', ':Gitsigns stage_hunk<CR>', {
    silent = true,
    noremap = true,
    desc = "Stage hunk"
})

vim.keymap.set('v', '<Leader>ga', ':Gitsigns stage_hunk<CR>', {
    silent = true,
    noremap = true,
    desc = "Stage selected hunk"
})

-- Reset hunk (annuler les modifications)
vim.keymap.set('n', '<Leader>gh', ':Gitsigns reset_hunk<CR>', {
    silent = true,
    noremap = true,
    desc = "Reset hunk"
})

vim.keymap.set('v', '<Leader>gh', ':Gitsigns reset_hunk<CR>', {
    silent = true,
    noremap = true,
    desc = "Reset selected hunk"
})

-- Undo stage hunk
vim.keymap.set('n', '<Leader>gU', ':Gitsigns undo_stage_hunk<CR>', {
    silent = true,
    noremap = true,
    desc = "Undo stage hunk"
})

-- Stage tout le buffer
vim.keymap.set('n', '<Leader>gA', ':Gitsigns stage_buffer<CR>', {
    silent = true,
    noremap = true,
    desc = "Stage buffer"
})

-- Reset tout le buffer
vim.keymap.set('n', '<Leader>gH', ':Gitsigns reset_buffer<CR>', {
    silent = true,
    noremap = true,
    desc = "Reset buffer"
})

-- EOF

