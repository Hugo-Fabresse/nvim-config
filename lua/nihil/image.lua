--
-- File name:
-- image.lua
--

local ok, image = pcall(require, "image")
if ok then
    image.setup({
        backend="kitty",
        integrations={markdown={enabled=true, only_render_image_at_cursor=false}},
        max_width=40,
        max_height=20
    })
end

-- EOF

