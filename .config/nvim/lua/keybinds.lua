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
map('n','<C-p>','<Esc>:Telescope live_grep<CR>')
map('n','<C-f>','<Esc>:Telescope find_files<CR>')
-- actual line
map('n','j','gj');
map('n','k','gk');

-- visual mode surround stuff
vim.api.nvim_set_keymap('v', '[', 'c[]<Esc>P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '(', 'c()<Esc>P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '{', 'c{}<Esc>P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '\"', 'c\"\"<Esc>P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '\'', 'c\'\'<Esc>P', { noremap = true, silent = true })


vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <C-L> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <C-L> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <C-H> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <C-H> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]


