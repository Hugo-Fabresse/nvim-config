--
-- File name:
-- telescope.lua
--

local ok, telescope = pcall(require, 'telescope')
if not ok then return end

-- Extensions
require('telescope').load_extension('file_browser')

-- Setup général de Telescope
telescope.setup({
    defaults = {
        layout_strategy = "horizontal",
        layout_config = { width = 0.8, height = 0.6, preview_width = 0.5 },
        sorting_strategy = "ascending",
        prompt_prefix = " ",
        selection_caret = " ",
        file_ignore_patterns = { "node_modules", ".git/" },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
        },
    },
})

-- EOF

