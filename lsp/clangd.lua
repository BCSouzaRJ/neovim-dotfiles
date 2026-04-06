return {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'c', 'cpp' },
    root_markers = { 'compile_commands.json', '.git' },
}
