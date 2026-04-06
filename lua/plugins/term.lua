return {
    'akinsho/toggleterm.nvim',
    config = function()
        require('toggleterm').setup({
            open_mapping = [[<C-\>]], -- Ctrl+\ abre/fecha
            direction = 'float',      -- 'horizontal', 'vertical' ou 'float'
            float_opts = {
                border = 'rounded',
            },
        })
    end,
}
