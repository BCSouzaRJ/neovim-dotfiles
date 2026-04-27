# Config "minimalista" da Bea ;)
Não é lá exatamente mínima, mas adicionei só o que uso com muita frequência em IDEs.

![dashboard inicial ao usar o comando nvim no terminal](./dashboard.png)

**Versão (Neovim):** 0.11.6  </br>
**Gerenciador de plugins:** Lazy.nvim </br>
**S.O.:** Arch Linux

### Notas importantes!
1. Atualmente, as LSPs estão todas sendo gerenciadas pela **API nativa do Neovim**. Sem mais lspconfig, pois prefiro o mínimo externo possível, e a nova API é excelente.
2. O Treesitter, essencial pra análise sintática do código, mudou algumas dependências na versão mais recente. Caso não funcione, cheque o repositório oficial deles pra ver quais pacotes faltam!

## LSPs
- Lua
- Javascript/Typescript
- Angular
- HTML e CSS
- C e C++
- Rust
- Go
- Python

## Configurações gerais
- Números de linha relativos
- Tabs de 4 espaços, sem arquivos de swap
- Undo persistente em `~/.vim/undodir`
- Sem wrap, scrolloff de 8 linhas
- **Autosave:** salva automaticamente ao sair do modo insert ou ao modificar o buffer
- **Timeout zero no insert mode:** evita delays de atalhos ao digitar

## Remaps

| Atalho        | Modo           | Origem     | Descrição |
|--------------|----------------|------------|----------|
| `<leader>..` | Normal         | Core       | Abre o explorador de arquivos (Ex / netrw). |
| `<leader>d`  | Normal/Visual  | Core       | Deleta sem copiar para o clipboard (registro "_"). |
| `<leader>dd` | Normal         | Core       | Deleta a linha inteira sem copiar para o clipboard. |
| `<leader>e`  | Normal         | LSP        | Mostra diagnóstico em popup flutuante. |
| `<leader>q`  | Normal         | LSP        | Lista todos os erros do buffer (location list). |
| `<F2>`       | Normal         | LSP        | Renomeia símbolo (variável, função, etc.). |
| `gd`         | Normal         | LSP        | Vai para a definição do símbolo. |
| `gr`         | Normal         | LSP        | Mostra referências do símbolo. |
| `K`          | Normal         | LSP        | Mostra documentação/hover do símbolo. |
| `<leader>o`  | Normal         | aerial.nvim | Abre/fecha a sidebar de estrutura do código. |
| `{`          | Normal         | aerial.nvim | Vai para o símbolo anterior (função, classe, etc.). |
| `}`          | Normal         | aerial.nvim | Vai para o próximo símbolo. |
| `<CR>`       | Insert         | blink.cmp  | Confirma autocomplete. |
| `<Tab>`      | Insert         | blink.cmp  | Seleciona próxima sugestão. |
| `<S-Tab>`    | Insert         | blink.cmp  | Seleciona sugestão anterior. |
| `<Esc>`      | Insert         | blink.cmp  | Cancela autocomplete. |
| `<C-m>,`     | Insert/Visual  | emmet-vim  | Expande abreviação Emmet. |
| `<C-\>`      | Normal         | toggleterm | Abre/fecha terminal flutuante. |

## Plugins

| Plugin              | Descrição |
|--------------------|----------|
| Comment.nvim        | Comenta e descomenta código rapidamente com atalhos, suportando diversos formatos de linguagem. |
| aerial.nvim         | Exibe uma visão estrutural do código (funções, classes, etc.) como uma sidebar, facilitando navegação. |
| blink.cmp           | Engine de autocomplete leve e rápida para Neovim, focada em performance e simplicidade. |
| bufferline.nvim     | Mostra os buffers abertos em formato de abas, permitindo navegação visual entre arquivos. |
| conform.nvim        | Formatador de código assíncrono com Prettier para JS, TS, CSS, HTML e JSON, rodando automaticamente ao salvar. |
| emmet-vim           | Expande abreviações Emmet em HTML e CSS (ex: `div.container>ul>li*3`). Ativado com `<C-m>,`. |
| markview.nvim       | Renderiza arquivos Markdown diretamente no buffer com formatação visual. |
| mason.nvim          | Gerenciador de ferramentas externas (LSP, linters, formatters), facilitando instalação e configuração. |
| nvim-autopairs      | Insere automaticamente pares de caracteres como `()`, `{}`, `[]`, `""`, etc., com contexto via Treesitter. |
| nvim-colorizer.lua  | Exibe cores inline no buffer para HTML, CSS e JavaScript (ex: `#fff`, `rgb()`). |
| nvim-lint           | Integra linters ao Neovim; atualmente usa `htmlhint` para arquivos HTML. |
| nvim-surround       | Adiciona, remove e altera delimitadores ao redor de seleções de texto (parênteses, aspas, tags, etc.). |
| nvim-treesitter     | Fornece parsing avançado de código para highlight, indentação e folding com a branch `main` (nova versão). |
| nvim-ts-autotag     | Fecha e renomeia tags HTML/JSX automaticamente usando Treesitter. |
| nvim-web-devicons   | Adiciona ícones a arquivos e interfaces (como telescope e bufferline). |
| plenary.nvim        | Biblioteca de utilidades em Lua usada como dependência por vários plugins. |
| rose-pine           | Tema elegante e minimalista para Neovim com foco em cores suaves. |
| telescope.nvim      | Ferramenta de busca fuzzy altamente extensível para arquivos, buffers, grep, etc. |
| toggleterm.nvim     | Abre um terminal flutuante com bordas arredondadas. |

É isso, espero que essa config ajude alguém. Qualquer coisa, contactar por email: </br>
📧 `beatriz.csouza.rj@gmail.com`
