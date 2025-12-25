--
-- File name:
-- noice.lua
--

local ok, noice = pcall(require, 'noice')
if ok then
    noice.setup({
        lsp={progress={enabled=false}}, 
        presets={bottom_search=true,long_message_to_split=true},
		cmdline = {
            view = "cmdline_popup",
        },
        views = {
            cmdline_popup = {
                position = {
                    row = "5%",  -- Position en haut (1 = première ligne)
                    col = "50%",  -- Centré horizontalement
                },
                size = {
                    width = 60,
                    height = "auto",
                },
            },
        },
    })
end

local ok2, notify = pcall(require, 'notify')
if ok2 then
    notify.setup({background_colour="#000000", fps=30, render="default", timeout=3000, top_down=true})
    vim.notify = notify
end

-- EOF

