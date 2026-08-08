return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
		default = {
			dir_path = "attachments",
		},
    -- add options here
filetypes={	
    tex = {
      relative_template_path = false, ---@type boolean | fun(): boolean
      template = [[
  \includegraphics[width=0.8\textwidth]{$FILE_PATH}
    ]], ---@type string | fun(context: table): string
    },
	typst = {
		template = [[
		$CURSOR #figure(image("$FILE_PATH", width: 80%)) 
			]],---@type string | fun(context: table): string
		}

		}
    -- or leave it empty to use the default settings
  },
  keys = {
    -- suggested keymap
    { "<F2>", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
