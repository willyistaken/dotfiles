vim.keymap.set('n', '<F5>',':w<CR>:terminal cargo run<CR>',{ silent = true })
vim.keymap.set('i', '<F5>', '<Esc><F5>', { silent = true })

vim.keymap.set('n','<F12>','<Esc>:!cp ~/.config/nvim/after/ftplugin/rstemp %:~<CR>')
