return {
    "kylechui/nvim-surround",
    version = "^3",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup()
    end
}
