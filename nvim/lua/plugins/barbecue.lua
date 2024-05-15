return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"folke/tokyonight.nvim",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		-- configurations go here
	},
	config = function()
		require("barbecue").setup({
			theme = "tokyonight",
		})
	end,
}
