return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c","cpp","lua", "vim","python", "vimdoc","markdown", "javascript", "html","css","bash","rust","latex","ruby","haskell","agda"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
		rainbow = {
   			 enable = true,
    		disable = { "cpp" },-- list of languages you want to disable the plugin for
    		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    		max_file_lines = nil, -- Do not enable for files with more than n lines, int
    		-- colors = {}, -- table of hex strings
    		-- termcolors = {} -- table of colour name strings
  		}
    })
    end
}

