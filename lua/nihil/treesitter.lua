--
-- File name:
-- treesitter.lua
--

local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

treesitter.setup({
    ensure_installed = { "lua", "python", "javascript", "typescript", "rust", "markdown" },
    highlight = { enable = true },
    indent = { enable = true },
})

-- EOF

