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

-- my Y
map('v','Y','"+y')
map('n','Y','"+y')
map('v','D','"+d')
map('n','D','"+d')
map('v','C','"+c')
map('n','C','"+c')

--plugin keybind--
map('n','<F7>','<Esc>:lua require("conform").format({})<CR>')




