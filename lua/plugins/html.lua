return {
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
            vim.g.user_emmet_install_global = 0
            vim.g.user_emmet_leader_key = "<C-y>"
        end,
        config = function()
            vim.cmd("EmmetInstall")
            vim.cmd("autocmd FileType html,css EmmetInstall")
            vim.keymap.set("i", "<leader>y", "<C-y>,", { remap = true })
            vim.keymap.set("v", "<leader>y", "<C-y>,", { remap = true })
        end,
    },
}
