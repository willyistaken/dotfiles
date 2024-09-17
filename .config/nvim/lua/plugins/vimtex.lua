return { 
    'lervag/vimtex',
    opt = true,
	lazy = false,
    config = function ()
        vim.g.vimtex_view_general_viewer = 'okular'
        vim.g.vimtex_compiler_latexmk_engines = {
            _ = '-xelatex'
        }
        vim.g.tex_comment_nospell = 1
		  vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_compiler_progname = 'nvr'
        vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex, -shell-escape]]
    end,
    ft = 'tex'
}
