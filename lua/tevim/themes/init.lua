local M = {}
local hl_files = vim.fn.stdpath("config") .. "/lua/tevim/themes/integrations"
local hl_files_custom = vim.fn.stdpath("config") .. "/lua/custom/themes/integrations"
local custom = vim.fn.stdpath("config") .. "/lua/custom/themes/schemes/"

M.check = function()
	for _, file in ipairs(vim.fn.readdir(custom)) do
		if file == vim.g.TeVimTheme .. ".lua" then
			return true
		end
	end
	return false
end

M.getCurrentTheme = function()
	local path = ""
	if M.check() then
		path = "custom.themes.schemes." .. vim.g.TeVimTheme
	else
		path = "tevim.themes.schemes." .. vim.g.TeVimTheme
	end
	local theme = require(path).get_colors()
	return theme
end

M.loadTb = function(g)
	g = require("tevim.themes.integrations." .. g)
	return g
end

M.loadCustomTb = function(g)
	g = require("custom.themes.integrations")
	return g
end

M.merge_tb = function(...)
	return vim.tbl_deep_extend("force", ...)
end

M.setTrans = function(highlights)
	local glassy = require("tevim.themes.trans")
	for key, value in pairs(glassy) do
		if highlights[key] then
			highlights[key] = M.merge_tb(highlights[key], value)
		end
	end
end

M.tableToStr = function(tb)
	local result = ""
	if vim.g.transparency then
		M.setTrans(tb)
	end
	for hlgroupName, hlgroup_vals in pairs(tb) do
		local hlname = "'" .. hlgroupName .. "',"
		local opts = ""
		for optName, optVal in pairs(hlgroup_vals) do
			local valueInStr = ((type(optVal)) == "boolean" or type(optVal) == "number") and tostring(optVal)
				or '"' .. optVal .. '"'
			opts = opts .. optName .. "=" .. valueInStr .. ","
		end
		result = result .. "vim.api.nvim_set_hl(0," .. hlname .. "{" .. opts .. "})"
	end
	return result
end

M.setTermColors = function()
	local colors = M.getCurrentTheme()
	vim.g.terminal_color_0 = colors.base01
	vim.g.terminal_color_1 = colors.base08
	vim.g.terminal_color_2 = colors.base0B
	vim.g.terminal_color_3 = colors.base0A
	vim.g.terminal_color_4 = colors.base0D
	vim.g.terminal_color_5 = colors.base0E
	vim.g.terminal_color_6 = colors.base0C
	vim.g.terminal_color_7 = colors.base05
	vim.g.terminal_color_8 = colors.base03
	vim.g.terminal_color_9 = colors.base08
	vim.g.terminal_color_10 = colors.base0B
	vim.g.terminal_color_11 = colors.base0A
	vim.g.terminal_color_12 = colors.base0D
	vim.g.terminal_color_13 = colors.base0E
	vim.g.terminal_color_14 = colors.base0C
	vim.g.terminal_color_15 = colors.base07
end

M.toCache = function(filename, tb)
	local lines = "return string.dump(function()" .. M.tableToStr(tb) .. "end, true)"
	local file = io.open(vim.g.theme_cache .. filename, "wb")
	if file then
		---@diagnostic disable-next-line: deprecated
		file:write(loadstring(lines)())
		file:close()
	end
end

local function indexOf(array, value)
	for i, v in ipairs(array) do
		if v == value then
			return i
		end
	end
	return nil
end
M.compile = function()
	if not vim.loop.fs_stat(vim.g.theme_cache) then
		vim.fn.mkdir(vim.g.theme_cache, "p")
	end
	local allThemes = {}
	for _, file in ipairs(vim.fn.readdir(hl_files)) do
		local filename = vim.fn.fnamemodify(file, ":r")
		local a = M.loadTb(filename)
		for k, f in pairs(a) do
			allThemes[k] = f
		end
	end
	local filename = vim.fn.fnamemodify(hl_files_custom, ":r")
	local a = M.loadCustomTb(filename)
	for k, f in pairs(a) do
		for _, i in pairs(allThemes) do
			if i == f then
				table.remove(allThemes, indexOf(allThemes, i))
				break
			end
		end
		allThemes[k] = f
	end
	M.toCache("allThemes", allThemes)
end

M.load = function()
	M.compile()
	dofile(vim.g.theme_cache .. "allThemes")
end

return M
