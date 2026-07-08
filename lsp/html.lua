return {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = { 'html' },
    -- Substituímos a lista fixa por uma função que valida o projeto
    root_dir = function(fname)
        -- Importa o utilitário nativo de caminhos do lspconfig
        local util = require('lspconfig.util')

        -- Se encontrar arquivos específicos do Angular, aborta o carregamento deste LSP
        if util.root_pattern('angular.json', 'nx.json')(fname) then
            return nil
        end

        -- Caso contrário, mantém o comportamento padrão procurando seus marcadores
        return util.root_pattern('package.json', '.git')(fname)
    end,
}
