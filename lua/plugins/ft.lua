return {
	{ "chrisbra/csv.vim", ft = { "csv" }, lazy = true },
	{ "sirtaj/vim-openscad", ft = { "openscad" }, lazy = true },
	{
		"ray-x/go.nvim",
		ft = { "go" },
		lazy = true,
		config = function()
			require("go").setup()
		end,
	},
}
