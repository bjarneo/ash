-- hlchunk highlights for Ash theme
local M = {}

function M.apply(colors)
	require("hlchunk").setup({
		chunk = {
			style = colors.comment, -- Using colors.comment for a gray/white style
		},
	})
end

return M

