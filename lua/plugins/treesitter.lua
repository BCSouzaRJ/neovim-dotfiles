return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- IMPORTANTE (nova versão)
    build = ":TSUpdate",
    lazy = false, -- treesitter NÃO suporta lazy loading

    config = function()
      local ts = require("nvim-treesitter")

      -- instala parsers
      ts.install({
        "lua",
        "javascript",
        "python",
        "bash",
        "html",
        "css",
	"rust"
      })

      -- ativa treesitter automaticamente
      vim.api.nvim_create_autocmd("FileType", {
        pattern = '*',
  callback = function()
    pcall(vim.treesitter.start)

    -- folding
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldenable = false
    vim.wo.foldlevel = 99

    -- indentação
    local ok = pcall(function()
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end)
    if not ok then
      -- fallback: indentação por sintaxe legada
      vim.bo.indentexpr = ''
    end
  end,
  })
    end,
  },
}
