vim.keymap.set('n', '<F5>', '<Esc>:w<CR>:VimtexCompile<CR>', { silent = true })
vim.keymap.set('i', '<F5>', '<Esc><F5>', { silent = true })
vim.keymap.set('n', '<F9>', '<Esc>:w<CR>:VimtexErrors<CR>', { silent = true })
vim.keymap.set('i', '<F9>', '<Esc><F9>', { silent = true })
vim.keymap.set('n','<F12>','<Esc>:w<CR>:!cat ~/.config/nvim/after/ftplugin/textemp >> %:~<CR>:e!<CR>:w<CR><CR>')

