--
-- File name:
-- edgy.lua
--

local ok, edgy = pcall(require, 'edgy')
if not ok then return end

edgy.setup({
    bottom={{ft="noice", size={height=0.4}, filter=function(_,win) return vim.api.nvim_win_get_config(win).relative=="" end}},
    left={{title="Files", ft="NvimTree", size={width=35}, pinned=true, open=function() require("nvim-tree.api").tree.open() end}},
    options={left={size=35}, bottom={size=10}, right={size=30}, top={size=10}},
    animate={enabled=false},
    wo={winbar=true, winfixwidth=true, winhighlight="WinBar:EdgyTitle", signcolumn="no"}
})

-- FIX POUR NVIM . : Ouvrir un fichier au démarrage
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(data)
        -- Si fichier normal, ne rien faire
        if data.file ~= "" and vim.fn.isdirectory(data.file) == 0 then
            return
        end
        
        -- Si dossier
        local is_dir = vim.fn.isdirectory(data.file) == 1
        if is_dir then
            vim.cmd.cd(data.file)
            
            -- Chercher un fichier à ouvrir
            local files = vim.fn.readdir('.', function(name)
                return vim.fn.isdirectory(name) == 0
            end)
            
            if #files > 0 then
                -- Ouvrir le premier fichier
                vim.schedule(function()
                    vim.cmd("edit " .. vim.fn.fnameescape(files[1]))
                end)
            end
        end
    end,
})

-- EOF

