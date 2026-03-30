return {
    'saghen/blink.cmp',
    version = '*',
    opts = {
        keymap = {
            preset      = 'default',
            ['<CR>']    = { 'accept', 'fallback' },      -- confirma com Enter
            ['<Tab>']   = { 'select_next', 'fallback' }, -- próxima sugestão
            ['<S-Tab>'] = { 'select_prev', 'fallback' }, -- sugestão anterior
            ['<Esc>']   = { 'cancel', 'fallback' },      -- cancela
        },
        appearance = {
            nerd_font_variant = 'mono', -- troca pra 'normal' se os ícones ficarem desalinhados
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        completion = {
            documentation = {
                auto_show = true, -- mostra docs automaticamente
                auto_show_delay_ms = 200,
            },
        },
    },
}
