return {
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = function()
			require("hlslens").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({
				triggers_blacklist = {
					c = { "h" },
				},
				show_help = false,
			})
		end,
	},
	{
		"kwkarlwang/bufresize.nvim",
		event = "VeryLazy",
		config = function()
			require("bufresize").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",

		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"sindrets/winshift.nvim",
		cmd = "WinShift",
	},
	{
		"folke/zen-mode.nvim",
		-- dir = "~/Programming/neovim-plugs/zen-mode.nvim",
		cmd = "ZenMode",
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 0.75,
					width = 120,
					height = 1, -- >1 dicates height of the actual window
				},
				plugins = {
					options = {
						enabled = true,
						ruler = true,
						showcmd = true,
					},
					twilight = { enabled = false },
					gitsigns = { enabled = true },
					tmux = { enabled = false },
				},
			})
		end,
	},
	{
		"folke/twilight.nvim",
		cmd = "Twilight",
		config = function()
			require("twilight").setup({
				dimming = {
					alpha = 0.25,
					color = { "Normal", "#ffffff" },
					inactive = false,
				},
				context = 10,
				treesitter = true,
				expand = {
					"function",
					"method",
					"table",
					"if_statement",
				},
				exclude = {},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"tknightz/telescope-termfinder.nvim",
		},
		cmd = "Telescope",
		event = "VeryLazy",
		config = function()
			CommandPaletteAllTheThings = function()
				vim.cmd("NeoTree")
				TF.Open()
			end

			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["<esc>"] = require("telescope.actions").close,
						},
					},
				},
				extensions = {},
				source_selector = {
					winbar = false,
					statusline = false,
				},
			})

			require("telescope").load_extension("file_browser")
			-- require("telescope").load_extension("git_worktree")
			require("telescope").load_extension("ui-select")
		end,
	},
}
