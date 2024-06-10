return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = { -- uses exact filenames
						".git",
					},
					never_show = {
						".DS_Store",
					},
				},
			},
			close_if_last_window = false,
		})
	end,
	cmd = "NeoTree float",
	keys = {
		{ "\\\\", ":Neotree reveal current<CR>", { desc = "NeoTree reveal" } },
		{ "<leader>gs", ":Neotree float git_status<CR>", { desc = "NeoTree git_status" } },
	},
}
