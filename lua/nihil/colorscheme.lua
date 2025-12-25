-- 
-- File name:
-- colorscheme.lua
--

-- Colorscheme et style Telescope
local function telescope_style()
    local bg_main = "#1a1b26"
    local bg_dark = "#16161e"
    local border = "#3b4261"
    local accent = "#7aa2f7"

    -- Fenêtres normales
    vim.api.nvim_set_hl(0, 'Normal', { bg = bg_main })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = bg_main })
    vim.api.nvim_set_hl(0, 'VertSplit', { fg = border, bg = bg_main })
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = border, bg = bg_main })

    -- Floats
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = bg_main })
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = border, bg = bg_main })

    -- Winbar / Edgy
    vim.api.nvim_set_hl(0, 'WinBar', { fg = accent, bg = bg_main })
    vim.api.nvim_set_hl(0, 'EdgyTitle', { fg = accent, bg = bg_dark, bold = true })
    vim.api.nvim_set_hl(0, 'EdgyIcon', { fg = accent, bg = bg_dark })

    -- NvimTree
    vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = bg_dark })
    vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = bg_dark, fg = bg_dark })
    vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { fg = border, bg = bg_dark })
end

vim.api.nvim_create_autocmd("ColorScheme", { pattern="*", callback=telescope_style })
vim.cmd("colorscheme tokyonight-night")
vim.cmd("doautocmd ColorScheme")

-- EOF

