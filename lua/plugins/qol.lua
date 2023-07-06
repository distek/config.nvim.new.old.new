return {
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_in_macro = true,
				enable_check_bracket_line = true,
			})
		end,
	},
	{
		"distek/fnote.nvim",
		-- 	dir = "~/Programming/neovim-plugs/fnote",
		config = function()
			require("fnote").setup({
				anchor = "NE",
				window = {
					offset = {
						x = 4,
						y = 2,
					},
				},

				border = "shadow",
			})
		end,
	},
	{ "tpope/vim-fugitive", event = "VeryLazy", cmd = "Git" },
	{ "tpope/vim-commentary" },
	{
		"ThePrimeagen/refactoring.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
