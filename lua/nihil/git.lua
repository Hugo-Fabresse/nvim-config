--
-- File name:
-- git.lua
--

-- ============================================================
-- FUGITIVE - Commandes Git de base
-- ============================================================
vim.keymap.set('n', '<Leader>gs', ':G<CR>', { 
    silent = true, 
    noremap = true, 
    desc = "Git status" 
})

vim.keymap.set('n', '<Leader>gc', ':G commit<CR>', { 
    silent = true, 
    noremap = true, 
    desc = "Git commit" 
})

vim.keymap.set('n', '<Leader>gw', ':G push<CR>', { 
    silent = true, 
    noremap = true, 
    desc = "Git push (write)" 
})

vim.keymap.set('n', '<Leader>gu', ':G pull<CR>', { 
    silent = true, 
    noremap = true, 
    desc = "Git pull (update)" 
})

vim.keymap.set('n', '<Leader>gd', ':Gdiffsplit<CR>', { 
    silent = true, 
    noremap = true, 
    desc = "Git diff" 
})

vim.keymap.set('n', '<Leader>gl', ':G log<CR>', { 
    silent = true, 
    noremap = true, 
    desc = "Git log" 
})

-- ============================================================
-- LAZYGIT - Interface graphique
-- ============================================================
vim.keymap.set('n', '<Leader>gg', ':LazyGit<CR>', {
    silent = true,
    noremap = true,
    desc = "Open LazyGit"
})

-- ============================================================
-- BLAMER - Git blame global
-- ============================================================

vim.g.blamer_enabled = 0
vim.g.blamer_delay = 200
vim.g.blamer_relative_time = 1
vim.g.blamer_prefix = ' '
vim.g.blamer_show_in_visual_modes = 0
vim.g.blamer_show_in_insert_modes = 0

vim.keymap.set('n', '<Leader>gB', ':BlamerToggle<CR>', {
    silent = true,
    noremap = true,
    desc = "Toggle full-file git blame"
})
-- EOF

