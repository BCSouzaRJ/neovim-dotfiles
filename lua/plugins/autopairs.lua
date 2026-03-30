return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
        require('nvim-autopairs').setup({
            check_ts = true, -- usa treesitter pra contexto (não fecha dentro de strings/comentários)
        })
    end,
}
