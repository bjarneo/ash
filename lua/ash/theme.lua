-- Ash theme colors and highlight definitions
local M = {}

-- Color palette
M.colors = {
	-- Base colors
	bg = "#1c1c1c",
	fg = "#c6c6c6",

	-- UI colors
	bg_alt = "#383838",
	bg_highlight = "#383838",
	bg_visual = "#626262",
	border = "#383838",

	-- Syntax colors
	comment = "#8a8a8a",
	comment_alt = "#8a8a8a",

	-- Functions and methods
	func = "#e0e0e0",
	func_builtin = "#e0e0e0",

	-- Strings
	string = "#b2b2b2",
	string_template = "#b2b2b2",
	string_escape = "#9e9e9e",
	string_regex = "#9e9e9e",

	-- Keywords and control flow
	keyword = "#9e9e9e",

	-- Types and classes
	type = "#9e9e9e",

	-- Constants and numbers
	constant = "#b2b2b2",
	number = "#b2b2b2",
	boolean = "#b2b2b2",

	-- Variables and properties
	variable = "#c6c6c6",
	property = "#c6c6c6",

	-- Operators and punctuation
	operator = "#9e9e9e",
	punctuation = "#8a8a8a",

	-- Special colors
	cursor = "#8a8a8a",
	line_number = "#8a8a8a",
	line_number_active = "#e0e0e0",

	-- Diagnostic colors
	error = "#9e9e9e",
	warning = "#9e9e9e",
	info = "#9e9e9e",
	hint = "#9e9e9e",

	-- Git colors
	git_add = "#626262",
	git_change = "#626262",
	git_delete = "#626262",
	git_ignore = "#8a8a8a",

	-- Terminal colors
	terminal_black = "#1c1c1c",
	terminal_red = "#9e9e9e",
	terminal_green = "#626262",
	terminal_yellow = "#9e9e9e",
	terminal_blue = "#9e9e9e",
	terminal_magenta = "#9e9e9e",
	terminal_cyan = "#9e9e9e",
	terminal_white = "#c6c6c6",
	terminal_bright_black = "#383838",
	terminal_bright_red = "#9e9e9e",
	terminal_bright_green = "#626262",
	terminal_bright_yellow = "#9e9e9e",
	terminal_bright_blue = "#9e9e9e",
	terminal_bright_magenta = "#9e9e9e",
	terminal_bright_cyan = "#9e9e9e",
	terminal_bright_white = "#e0e0e0",

	-- Additional colors
	none = "NONE",
}

-- Helper function to set highlights
local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Apply theme with configuration
function M.apply(config)
	local colors = vim.tbl_deep_extend("force", M.colors, config.colors or {})

	-- Apply background override if disabled
	if config.disable.background then
		colors.bg = "NONE"
	end

	-- Editor highlights
	hl("Normal", { fg = colors.fg, bg = colors.bg })
	hl("NormalFloat", { fg = colors.fg, bg = colors.bg })
	hl("FloatBorder", { fg = colors.border, bg = colors.bg })
	hl("ColorColumn", { bg = colors.bg_alt })
	hl("Cursor", { fg = colors.bg, bg = colors.cursor })
	hl("CursorLine", { bg = colors.bg_highlight })
	hl("CursorColumn", { bg = colors.bg_highlight })
	hl("LineNr", { fg = colors.line_number })
	hl("CursorLineNr", { fg = colors.line_number_active, bold = true })
	hl("SignColumn", { bg = colors.bg })
	hl("StatusLine", { fg = colors.fg, bg = colors.bg })
	hl("StatusLineNC", { fg = colors.comment_alt, bg = colors.bg })
	hl("TabLine", { fg = colors.comment_alt, bg = colors.bg })
	hl("TabLineFill", { bg = colors.bg })
	hl("TabLineSel", { fg = colors.fg, bg = colors.bg })
	hl("VertSplit", { fg = colors.border })
	hl("WinSeparator", { fg = colors.border })
	hl("Visual", { bg = colors.bg_visual })
	hl("VisualNOS", { bg = colors.bg_visual })
	hl("Search", { fg = colors.bg, bg = colors.func })
	hl("IncSearch", { fg = colors.bg, bg = colors.string_escape })
	hl("CurSearch", { fg = colors.bg, bg = colors.string_escape })
	hl("Substitute", { fg = colors.bg, bg = colors.string_escape })
	hl("MatchParen", { fg = colors.cursor, bg = colors.bg_highlight, bold = true })
	hl("Question", { fg = colors.info })
	hl("ModeMsg", { fg = colors.fg })
	hl("MoreMsg", { fg = colors.info })
	hl("ErrorMsg", { fg = colors.error })
	hl("WarningMsg", { fg = colors.warning })
	hl("Pmenu", { fg = colors.fg, bg = colors.bg_alt })
	hl("PmenuSel", { fg = colors.fg, bg = colors.bg_highlight })
	hl("PmenuSbar", { bg = colors.bg_highlight })
	hl("PmenuThumb", { bg = colors.border })
	hl("WildMenu", { fg = colors.fg, bg = colors.bg_highlight })
	hl("Folded", { fg = colors.comment, bg = colors.bg_alt })
	hl("FoldColumn", { fg = colors.comment, bg = colors.bg })
	hl("Directory", { fg = colors.info })
	hl("Title", { fg = colors.keyword, bold = true })
	hl("NonText", { fg = colors.comment })
	hl("SpecialKey", { fg = colors.comment })
	hl("Whitespace", { fg = colors.comment })
	hl("EndOfBuffer", { fg = colors.bg })

	-- Syntax highlighting
	local comment_style = { fg = colors.comment }
	if not config.disable.italic_comments then
		comment_style.italic = true
	end

	hl("Comment", comment_style)
	hl("Todo", { fg = colors.comment_alt, bold = true })
	hl("Constant", { fg = colors.constant })
	hl("String", { fg = colors.string })
	hl("Character", { fg = colors.string })
	hl("Number", { fg = colors.number })
	hl("Float", { fg = colors.number })
	hl("Boolean", { fg = colors.boolean })
	hl("Identifier", { fg = colors.variable })
	hl("Function", { fg = colors.func })
	hl("Statement", { fg = colors.keyword })
	hl("Conditional", { fg = colors.keyword, bold = true })
	hl("Repeat", { fg = colors.keyword, bold = true })
	hl("Label", { fg = colors.type })
	hl("Operator", { fg = colors.operator })
	hl("Keyword", { fg = colors.keyword })
	hl("Exception", { fg = colors.keyword })
	hl("PreProc", { fg = colors.keyword })
	hl("Include", { fg = colors.keyword, italic = true })
	hl("Define", { fg = colors.keyword })
	hl("Macro", { fg = colors.keyword, bold = true })
	hl("PreCondit", { fg = colors.keyword })
	hl("Type", { fg = colors.type })
	hl("StorageClass", { fg = colors.keyword })
	hl("Structure", { fg = colors.type })
	hl("Typedef", { fg = colors.type })
	hl("Special", { fg = colors.string_escape })
	hl("SpecialChar", { fg = colors.string_escape, bold = true })
	hl("Tag", { fg = colors.keyword })
	hl("Delimiter", { fg = colors.punctuation })
	hl("SpecialComment", { fg = colors.comment_alt, italic = true })
	hl("Debug", { fg = colors.error })
	hl("Underlined", { underline = true })
	hl("Ignore", { fg = colors.comment })
	hl("Error", { fg = colors.error })

	-- Apply plugin-specific highlights based on config
	if config.plugins.treesitter then
		require("ash.plugins.treesitter").apply(colors, config)
	end

	if config.plugins.lsp then
		require("ash.plugins.lsp").apply(colors, config)
	end

	if config.plugins.telescope then
		require("ash.plugins.telescope").apply(colors, config)
	end

	if config.plugins.nvimtree then
		require("ash.plugins.nvimtree").apply(colors, config)
	end

	if config.plugins.whichkey then
		require("ash.plugins.whichkey").apply(colors, config)
	end

	if config.plugins.gitsigns then
		require("ash.plugins.gitsigns").apply(colors, config)
	end

	if config.plugins.indent_blankline then
		require("ash.plugins.indent_blankline").apply(colors, config)
	end

	if config.plugins.markdown then
		require("ash.plugins.markdown").apply(colors, config)
	end

	-- Apply terminal colors if not disabled
	if not config.disable.terminal_colors then
		vim.g.terminal_color_0 = colors.terminal_black
		vim.g.terminal_color_1 = colors.terminal_red
		vim.g.terminal_color_2 = colors.terminal_green
		vim.g.terminal_color_3 = colors.terminal_yellow
		vim.g.terminal_color_4 = colors.terminal_blue
		vim.g.terminal_color_5 = colors.terminal_magenta
		vim.g.terminal_color_6 = colors.terminal_cyan
		vim.g.terminal_color_7 = colors.terminal_white
		vim.g.terminal_color_8 = colors.terminal_bright_black
		vim.g.terminal_color_9 = colors.terminal_bright_red
		vim.g.terminal_color_10 = colors.terminal_bright_green
		vim.g.terminal_color_11 = colors.terminal_bright_yellow
		vim.g.terminal_color_12 = colors.terminal_bright_blue
		vim.g.terminal_color_13 = colors.terminal_bright_magenta
		vim.g.terminal_color_14 = colors.terminal_bright_cyan
		vim.g.terminal_color_15 = colors.terminal_bright_white
	end

	-- Apply user-defined highlight overrides
	for group, opts in pairs(config.highlights or {}) do
		hl(group, opts)
	end
end

return M
