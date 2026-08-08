vim.keymap.set('n', '<F5>', '<Esc>:w<CR>:!marktext "%:r".md &<CR>', { silent = false })
vim.keymap.set('i', '<F5>', '<Esc><F5>', { silent = true })
