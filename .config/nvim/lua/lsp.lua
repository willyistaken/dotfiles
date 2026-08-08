local lsp_zero = require('lsp-zero')
local on_attach = function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end

--vim.g.lspconfig
local capabilities = vim.lsp.protocol.make_client_capabilities()



vim.lsp.enable('ccls', {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = { cache = { directory = vim.fn.stdpath("cache") .. "/ccls" } },
})

vim.lsp.enable('pyright', { 
  on_attach = on_attach, 
  capabilities = capabilities 
})

vim.lsp.enable('texlab', { 
  on_attach = on_attach, 
  capabilities = capabilities 
})



vim.lsp.config["tinymist"] = {

    cmd = { "tinymist" },

    filetypes = { "typst" ,"typ"},

    settings = {
		exportPdf = "onType",
    formatterMode = "typstyle",
    preview = {
      viewer = "zathura",
    }

    }

}


vim.lsp.enable('tinymist')

vim.lsp.enable('ruby_lsp', {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    enabledFeatures = {
      "codeActions", "diagnostics", "documentHighlights", "documentSymbols",
      "foldingRanges", "formatting", "hover", "inlayHint", "onTypeFormatting",
      "selectionRanges", "semanticHighlighting", "completion"
    },
    bundleGemfile = vim.fn.getcwd() .. "/Gemfile",
  },
  settings = {
    rubyLsp = {
      -- Use "rbenv", "asdf", "mise", etc. depending on your setup
      rubyVersionManager = "auto", 
    }
  }
})


