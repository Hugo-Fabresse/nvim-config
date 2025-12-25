-- 
-- File name:
-- completion.lua
--

local ok, cmp = pcall(require, 'cmp')
if not ok then return end

local ok_ls, luasnip = pcall(require, "luasnip")
if not ok_ls then return end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- On laisse le Tab pour LuaSnip
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
})

-- EOF

