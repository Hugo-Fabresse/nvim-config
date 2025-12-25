-- 
-- File name:
-- bufferline.lua
--

local ok, bufferline = pcall(require, 'bufferline')
if not ok then return end

bufferline.setup({
    options = {
        mode = "buffers",
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
        indicator = { style = "underline" },
        offsets = {{filetype="NvimTree", text="Explorer", text_align="center", separator=true}},
    }
})

-- Navigation et fermeture buffers
vim.keymap.set('n','<Tab>', ':bnext<CR>', {silent=true,noremap=true})
vim.keymap.set('n','<S-Tab>', ':bprevious<CR>', {silent=true,noremap=true})
vim.keymap.set('n','<Leader>x', function()
    local cur = vim.api.nvim_get_current_buf()
    if #vim.fn.getbufinfo({buflisted=1})>1 then vim.cmd('bnext') end
    vim.cmd('bdelete '..cur)
end, {silent=true,noremap=true})
vim.keymap.set('n','<Leader>bo', function()
    local cur = vim.api.nvim_get_current_buf()
    for _,b in ipairs(vim.api.nvim_list_bufs()) do
        local name = vim.api.nvim_buf_get_name(b)
        if b~=cur and not name:match("NvimTree_") and vim.api.nvim_buf_is_loaded(b) then
            vim.cmd('bdelete '..b)
        end
    end
end, {silent=true,noremap=true})

-- EOF

