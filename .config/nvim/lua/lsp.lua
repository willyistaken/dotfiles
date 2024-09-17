local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require'lspconfig'.pyright.setup{
	python = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "workspace",
      useLibraryCodeForTypes = true
    }
  }
}
require'lspconfig'.bashls.setup{filetypes={ "sh","zsh" }}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.texlab.setup{}

