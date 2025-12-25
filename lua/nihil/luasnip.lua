--
-- File name:
-- luasnip.lua
--

vim.cmd [[packadd LuaSnip]]

local ok, luasnip = pcall(require, "luasnip")
if not ok then return end

-- Charger les snippets Lua
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })

-- Mappage Tab/S-Tab pour LuaSnip (en insert et select mode)
vim.keymap.set({"i", "s"}, "<Tab>", function(fallback)
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    else
        fallback()
    end
end, {expr = false, silent = true})

vim.keymap.set({"i", "s"}, "<S-Tab>", function(fallback)
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
end, {expr = false, silent = true})

-- EOF

