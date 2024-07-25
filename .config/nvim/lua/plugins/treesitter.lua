return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {"cpp", "c", "lua", "vim","python", "vimdoc","markdown", "javascript", "html","css","bash","rust","latex" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
}

