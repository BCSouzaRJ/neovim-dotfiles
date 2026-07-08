return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            ft = {
                css = '/* %s */',
                scss = '/* %s */',
            }
        })
    end
}
