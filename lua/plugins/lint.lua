return {
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            html = { 'htmlhint' },
        }
        vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
            callback = function()
                require('lint').try_lint()
            end,
        })
    end,
}
