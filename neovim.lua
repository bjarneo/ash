return {
	"bjarneo/ash",
	lazy = false,
	priority = 1000,
	name = "ash", -- Explicitly set the name for lazy.nvim
	config = function()
		vim.cmd.colorscheme("ash")
	end,
}