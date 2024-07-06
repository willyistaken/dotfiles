vim.keymap.set('n', '<F5>', '<Esc>:w<CR>:terminal g++ -g -Wall -Wextra -Wshadow -fsanitize=undefined %:~:r.cpp -o %:~:r && echo \"compiled\" && %:~:r<CR>', { silent = true })
vim.keymap.set('i', '<F5>', '<Esc><F5>', { silent = true })
vim.keymap.set('n','<F12>','<Esc>:!cp ~/.config/nvim/after/ftplugin/cpptemp %:~<CR>:e!<CR><CR>')
