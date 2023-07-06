local map = vim.keymap.set

map("n", "<A-q>", "<cmd>bd<CR>")

-- Window movement
map("n", "<C-W>H", "<cmd>WinShift left<cr>")
map("n", "<C-W>J", "<cmd>WinShift down<cr>")
map("n", "<C-W>K", "<cmd>WinShift up<cr>")
map("n", "<C-W>L", "<cmd>WinShift right<cr>")

map("n", "<leader>z", ":ZenMode<cr>", { desc = "Zen mode" })

map("n", "<A-f>", function()
	require("zen-mode").toggle({
		window = {
			width = 1.0,
		},
	})
end, { desc = "Fullscreen window" })
