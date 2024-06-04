return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	init = function()
		require("tokyonight").setup({
			style = "night",
			-- disable italic for functions
			transparent = true,
			styles = {
				functions = {},
			},
		})

		vim.cmd.colorscheme("tokyonight-night")

		vim.cmd.hi("Comment gui=none")
	end,
}
