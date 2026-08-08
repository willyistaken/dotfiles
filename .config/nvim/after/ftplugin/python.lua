vim.keymap.set('n', '<F5>',':w<CR>:terminal python3 %:r.py<CR>',{ silent = true })
vim.keymap.set('i', '<F5>', '<Esc><F5>', { silent = true })
