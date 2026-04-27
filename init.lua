require("stelle")
require("stelle.lazy")

vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function()
        vim.o.timeoutlen = 0
    end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
        vim.o.timeoutlen = 300
    end,
})

vim.lsp.enable({
    'ts_ls',
    'cssls',
    'gopls',
    'html',
    'lua_ls',
    'pyright',
    'rust_analyzer',
    'clangd',
    'angularls'
})

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- ícone antes da mensagem
        spacing = 4, -- espaço entre o código e a mensagem
    },
    signs = true, -- ícones na coluna lateral (gutter)
    underline = true, -- sublinha o trecho com problema
    update_in_insert = true, -- não atualiza enquanto digita
    severity_sort = true, -- erros aparecem antes de warnings
    float = {
        border = 'rounded', -- borda da janela flutuante
        source = true, -- mostra qual LSP gerou o erro
    },
})

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        require('dashboard').open()
    end,
})

vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave' }, {
    pattern = '*',
    callback = function()
        if vim.bo.modified and vim.bo.buftype == '' and vim.fn.expand('%') ~= '' then
            vim.cmd('silent! write')
        end
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local opts = { buffer = args.buf }

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- ...

        -- rename
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    end,
})
