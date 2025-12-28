--
-- File name:
-- nvimtree.lua
--

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,

    update_focused_file = {
        enable = true,
        update_root = true,
    },

    view = {
        width = 35,
        side = "left",
        float = { enable = false },
    },

    renderer = {
        highlight_git = true,
        indent_markers = { enable = true },
        icons = { show = { file = true, folder = true, folder_arrow = true, git = true } },
    },

    filters = { dotfiles = false },

    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = { enable = true },
        },
    },

    git = { enable = true, ignore = false },
})

------------------------------------------------------------
-- Open NvimTree on startup for directories or empty session
------------------------------------------------------------
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(data)
        local is_dir = (data.file ~= "" and vim.fn.isdirectory(data.file) == 1)
        local no_file = (data.file == "")

        if not is_dir and not no_file then
            return
        end

        if is_dir then
            vim.cmd.cd(data.file)
        end

        -- open first file if any
        local files = vim.fn.readdir(".", function(name)
            return vim.fn.isdirectory(name) == 0
        end)

        if #files > 0 then
            vim.cmd("edit " .. vim.fn.fnameescape(files[1]))
        end

        vim.defer_fn(function()
            require("nvim-tree.api").tree.open()
            if #files > 0 then
                vim.cmd("wincmd l")
            end
        end, 10)
    end,
})

------------------------------------------------------------
-- Toggle focus between buffer <-> tree
------------------------------------------------------------
local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>e", function()
    if vim.bo.filetype == "NvimTree" then
        vim.cmd("wincmd p")   -- return to previous window
    else
        api.tree.find_file({ open = true, focus = true })
    end
end, { silent = true, noremap = true })

-- EOF

