return {
{
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
        require("nvim-ts-autotag").setup({
            opts = {
                enable_close = true,        -- fecha a tag automaticamente
                enable_rename = true,       -- renomeia a tag par ao mesmo tempo
                enable_close_on_slash = false
            },
        })
    end,
},
    -- Mostra cores inline (#fff, rgb(), etc.)
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function()
            require("colorizer").setup({ "html", "css", "javascript" })
        end,
    },

    -- Emmet: expande abreviações como div.container>ul>li*3
    {
        "mattn/emmet-vim",
        ft = { "html", "css", "javascriptreact", "typescriptreact" },
        init = function()
            local html_boilerplate = table.concat({
                "<!DOCTYPE html>",
                "<html lang=\"en\">",
                "<head>",
                "\t<meta charset=\"UTF-8\">",
                "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
                "\t<title>Document</title>",
                "</head>",
                "<body>",
                "\t",
                "</body>",
                "</html>",
            }, "\n")

            vim.g.user_emmet_install_global = 0
            vim.g.user_emmet_leader_key = "<C-m>"
            vim.g.user_emmet_settings = {
                variables = { lang = "en" },
                html = {
                    snippets = {
                        ["!"] = html_boilerplate,
                    },
                },
            }
        end,
        config = function()
            vim.cmd("autocmd FileType html,css EmmetInstall")
            vim.keymap.set("i", "<leader>y", "<C-m>,", { remap = true })
            vim.keymap.set("v", "<leader>y", "<C-m>,", { remap = true })
        end,
    },
}
