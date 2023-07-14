local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local function insert(group, plugins)
	for _, v in ipairs(group) do
		table.insert(plugins, v)
	end

	return plugins
end

local function getPlugins()
	local plugins = {}

	plugins = insert(require("plugins.dap"), plugins)
	plugins = insert(require("plugins.ft"), plugins)
	plugins = insert(require("plugins.layout"), plugins)
	plugins = insert(require("plugins.lsp"), plugins)
	plugins = insert(require("plugins.misc"), plugins)
	plugins = insert(require("plugins.qol"), plugins)
	plugins = insert(require("plugins.treesitter"), plugins)

	return plugins
end

require("lazy").setup({
	spec = getPlugins(),
	opts = {
		concurrency = 10,
	},
})

require("util")

require("ui.lush")
require("ui.statuscolumn")

require("globals")

require("mappings.debug")
require("mappings.lsp")
require("mappings.misc")
require("mappings.os")
require("mappings.telescope")
require("mappings.window")
