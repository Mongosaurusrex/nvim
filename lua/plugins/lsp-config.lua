return {
  {
    "williamboman/mason.nvim",
    version = "^1.0.0",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "^1.0.0",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "pyright",
          "volar",
          "elixirls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Override defaults for a specific server
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
      })

      vim.lsp.config('pyright', {
        capabilities = capabilities,
      })

      vim.lsp.config('tsserver', {
        capabilities = capabilities,
      })

      vim.lsp.config('vue_ls', {
        capabilities = capabilities,
      })

      -- Enable all
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('pyright')
      vim.lsp.enable('tsserver')
      vim.lsp.enable('volar')

      -- Set default keybinds for all LSP buffers
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
        end,
      })
    end,
  },

  -- ELIXIR
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        elixirls = {
          enable = true,
          cmd = { "/Users/mongosaurus/.elixir-ls/release/language_server.sh" },
          settings = elixirls.settings({
            dialyzerEnabled = false,
            enableTestLenses = false,
          }),
          on_attach = function(client, bufnr)
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = bufnr })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = bufnr })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = bufnr })
          end,
        },
      })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
