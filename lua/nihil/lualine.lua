--
-- File name:
-- lualine.lua
--

local ok, lualine = pcall(require, 'lualine')
if not ok then return end

lualine.setup({
    options = {
        theme = 'tokyonight',
        globalstatus = true,
        section_separators = { left='', right='' },
        component_separators = { left='│', right='│' },
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'diagnostics'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
    },
})

-- EOF

