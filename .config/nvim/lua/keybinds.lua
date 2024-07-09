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
map('n',' h','<Esc>:Telescope yank_history<CR>')
map('n',' f','<Esc>:Telescope find_files<CR>')
map('n',' v','<Esc>:Telescope treesitter<CR>')
map('n',' d','<Esc>:lua vim.diagnostic.open_float()<Cr>')
map('n', ' U', vim.cmd.UndotreeToggle)
