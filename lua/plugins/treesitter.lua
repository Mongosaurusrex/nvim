return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "javascript", "python", "typescript", "elixir", "eex", "heex" },
			highlight = { enable = true },
      auto_install = true,
			indent = { enable = true },
		})
	end,
}
