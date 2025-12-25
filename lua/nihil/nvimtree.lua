--
-- File name:
-- nvimtree.lua
--

local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = { enable=true, update_root=true },
    view = { width=35, side="left", float={enable=false} },
    renderer = { highlight_git=true, indent_markers={enable=true}, icons={show={file=true, folder=true, folder_arrow=true, git=true}} },
    filters = { dotfiles=false },
    actions = { open_file={quit_on_open=false, resize_window=true, window_picker={enable=true}} },
    git = { enable=true, ignore=false },
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(data)
        -- Si fichier normal, ne rien faire
        if data.file ~= "" and vim.fn.isdirectory(data.file) == 0 then
            return
        end
        
        -- Si dossier ou pas de fichier
        local is_dir = vim.fn.isdirectory(data.file) == 1
        local no_file = data.file == ""
        
        if is_dir or no_file then
            if is_dir then
                vim.cmd.cd(data.file)
            end
            
            -- Chercher un fichier à ouvrir
            local files = vim.fn.readdir('.', function(name)
                return vim.fn.isdirectory(name) == 0
            end)
            
            if #files > 0 then
                -- Ouvrir le premier fichier trouvé
                vim.cmd("edit " .. vim.fn.fnameescape(files[1]))
            end
            
            -- Toujours ouvrir nvim-tree après
            vim.defer_fn(function()
                require("nvim-tree.api").tree.open()
                -- Retourner au buffer du fichier si on en a ouvert un
                if #files > 0 then
                    vim.cmd("wincmd l")
                end
            end, 10)
        end
    end,
})

vim.keymap.set('n','<Leader>e', ':NvimTreeFindFile<CR>', {silent=true,noremap=true})

-- EOF

