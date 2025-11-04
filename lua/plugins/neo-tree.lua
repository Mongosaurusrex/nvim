return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {})
		vim.cmd([[
      hi NeoTreeNormal guibg=NONE ctermbg=NONE
      hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
      hi NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
    ]])

		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignores = true,
				},
			},
		})
	end,
}
