#vim.keymap.set('n', '<F5>', '<Esc>:w<CR>:OpenPdf<CR>', { silent = true })
vim.keymap.set('n', '<F5>', function()
    local pdf_path = vim.fn.expand('%:r') .. '.pdf'
    vim.ui.open(pdf_path)
end, { desc = 'Open compiled Typst PDF' })
vim.keymap.set('n', '<F9>', '<Esc>:w<CR>:!tinymist compile %:r.typ<CR>')
vim.keymap.set('n','<F12>','<Esc>:w<CR>:!cat ~/.config/nvim/after/ftplugin/typsttemp >> %:~<CR>:e!<CR>:w<CR><CR>')
