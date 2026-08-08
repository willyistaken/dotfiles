require('keybinds')
require('options')
require('plugins-setup')
require('lsp')
require('autocomplete')
require('calc')

vim.filetype.add({
  extension = {
    jack = "jack",
  },
})
vim.treesitter.language.register("cpp","jack")

