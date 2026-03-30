vim.g.mapleader = " "
vim.keymap.set("n", "<leader>..", vim.cmd.Ex)

-- deletar sem salvar no clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')
vim.keymap.set('n', '<leader>dd', '"_dd')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist) -- lista todos os erros do buffer

vim.keymap.set('n', '<F2>', vim.lsp.buf.rename)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
