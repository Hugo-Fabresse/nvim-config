--
-- File name:
-- padding.lua
--

vim.api.nvim_create_autocmd({"BufWinEnter","WinEnter"}, {
    callback=function()
        local ft = vim.bo.filetype
        if ft~="NvimTree" and ft~="TelescopePrompt" and ft~="noice" and ft~="" then
            vim.opt_local.foldcolumn="1"
        end
    end
})

-- EOF

