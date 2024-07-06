local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end


--basic navigation and autocomplete--
map('i','jj','<Esc>')
map('i','[','[]<Esc>i')
map('i','(','()<Esc>i')
map('i','\'','\'\'<Esc>i')
map('i','\"','\"\"<Esc>i')
map('i','{<CR>','{<CR>}<Esc>i')


--plugin keybind--
map('n',' fh','<Esc>:Telescope yank_history<CR>')
map('n','<C-p>','<Esc>:Telescope find_files<CR>')
map('n',' fv','<Esc>:Telescope treesitter<CR>')

map('n',' fd','<Esc>:lua vim.diagnostic.open_float()<Cr>')
