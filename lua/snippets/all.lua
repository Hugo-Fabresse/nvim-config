local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

local function filename()
    return vim.fn.expand("%:t")
end

local function date()
    return os.date("%Y-%m-%d")
end

ls.add_snippets("all", {
    s("epi", {
        t({"/*",
        "** EPITECH PROJECT, 2025",
        "** Created by hugo on "}), f(date), t({ "",
        "** File description:",
        "** "}), f(filename), t({ "",
        "*/", "" }),
    })
})

