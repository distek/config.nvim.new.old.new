-- Returns to previous position in file
Util.line_return = function()
	local line = vim.fn.line

	if line("'\"") > 0 and line("'\"") <= line("$") then
		vim.cmd("normal! g`\"zvzz'")
	end
end

Util.dapStart = function()
	local dapui = require("dapui")
	dapui.open({})
end

Util.dapStop = function()
	local dap = require("dap")
	local dapui = require("dapui")

	if dap.session() then
		dap.disconnect()
	end

	dap.close()
	dapui.close({})
end

Util.getColor = function(group, attr)
	return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
end

Util.getNeighbors = function()
	local ret = {
		top = false,
		bottom = false,
		left = false,
		right = false,
	}

	if #vim.api.nvim_list_wins() == 1 then
		return ret
	end

	local currentWin = vim.fn.winnr()

	if currentWin ~= vim.fn.winnr("k") then
		ret.top = true
	end

	if currentWin ~= vim.fn.winnr("j") then
		ret.bottom = true
	end

	if currentWin ~= vim.fn.winnr("h") then
		ret.left = true
	end

	if currentWin ~= vim.fn.winnr("l") then
		ret.right = true
	end

	return ret
end

Util.printAllWindowBuffers = function()
	for _, v in ipairs(vim.api.nvim_list_wins()) do
		local name = vim.fn.bufname(vim.api.nvim_win_get_buf(v))
		if name then
			print(name)
		else
			print("unnamed")
		end
	end
end

Util.printAllWindowConfigs = function()
	for _, v in ipairs(vim.api.nvim_list_wins()) do
		vim.print(vim.api.nvim_win_get_config(v))
	end
end

Util.vimCmdToBuffer = function(cmd)
	local output = vim.api.nvim_command_output(cmd)

	vim.cmd("vnew")

	for line in string.gmatch(output, "([^\n]+)") do
		vim.api.nvim_buf_set_lines(0, 0, 0, false, { line })
	end
end

Util.printAllTerminalColors = function()
	print("background: " .. Util.getColor("Normal", "bg"))
	print("foreground: " .. Util.getColor("Normal", "fg"))
	print("color0: " .. vim.g.terminal_color_0)
	print("color1: " .. vim.g.terminal_color_1)
	print("color2: " .. vim.g.terminal_color_2)
	print("color3: " .. vim.g.terminal_color_3)
	print("color4: " .. vim.g.terminal_color_4)
	print("color5: " .. vim.g.terminal_color_5)
	print("color6: " .. vim.g.terminal_color_6)
	print("color7: " .. vim.g.terminal_color_7)
	print("color8: " .. vim.g.terminal_color_8)
	print("color9: " .. vim.g.terminal_color_9)
	print("color10: " .. vim.g.terminal_color_10)
	print("color11: " .. vim.g.terminal_color_11)
	print("color12: " .. vim.g.terminal_color_12)
	print("color13: " .. vim.g.terminal_color_13)
	print("color14: " .. vim.g.terminal_color_14)
	print("color15: " .. vim.g.terminal_color_15)
end
