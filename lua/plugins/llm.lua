return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    provider = "ollama",
    ollama = {
      endpoint = "http://127.0.0.1:11434",
      model = "llama3.1:8b",
    },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },
}

-- Keybindings Summary:
--
-- Sidebar Controls:
--   <Leader>aa  - Show sidebar
--   <Leader>at  - Toggle sidebar visibility
--   <Leader>ar  - Refresh sidebar
--   <Leader>af  - Switch sidebar focus
--   <Leader>a?  - Select model
--   <Leader>ae  - Edit selected blocks
--
-- Conflict Resolution:
--   co   - Choose ours
--   ct   - Choose theirs
--   ca   - Choose all theirs
--   c0   - Choose none
--   cb   - Choose both
--   cc   - Choose cursor
--
-- Navigation:
--   ]x   - Move to previous conflict
--   [x   - Move to next conflict
--   [[   - Jump to previous codeblocks (results window)
--   ]]   - Jump to next codeblocks (results window)
-- ]]
