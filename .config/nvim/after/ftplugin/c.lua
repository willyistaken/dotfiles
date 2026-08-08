vim.keymap.set('n', '<F5>', '<Esc>:w<CR>:terminal gcc -Wall -Wextra -Wshadow -fsanitize=undefined,address -g %:r.c -o %:r && echo \"compiled\" && ./%:r < input <CR>', { silent = true })
vim.keymap.set('i', '<F5>', '<Esc><F5>', { silent = true })
vim.keymap.set('n','<F12>','<Esc>:!cp ~/.config/nvim/after/ftplugin/cpptemp %:~r.c<CR>')
