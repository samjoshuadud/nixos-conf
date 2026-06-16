return {
  { -- Mason for downloading mason
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },


  { -- Mason Config for Downloading Language Server
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    opts = {
      auto_install = true,
    },
  },


  { -- Communication between languange server and nvim
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.workspace = capabilities.workspace or {}
      capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = true }

      capabilities.workspace.workspaceFolders = true

      -- local lspconfig = require("lspconfig")
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      -- Lua Language Server
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- C# Language Server
      vim.lsp.config("csharp_ls", {
        capabilities = capabilities
      })

      -- Python Language Server
      -- vim.lsp.config("pylsp", {
      --   capabilities = capabilities,
      --   settings = {
      --     pylsp = {
      --       plugins = {
      --         pylint = { enabled = true },
      --         pyflakes = { enabled = false },
      --         yapf = { enabled = true },
      --       },
      --     },
      --   },
      -- })
      -- Tailwind CSS
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
      })

      vim.lsp.config("basedpyright", {
        capabilities = capabilities,
      })
      -- vim.lsp.config("pyright", {
      --   capabilities = capabilities,
      -- })

      -- PHP
      vim.lsp.config("phpactor", {
        capabilities = capabilities,
      })

      -- JavaScript / TypeScript
      vim.lsp.config("ast_grep", {
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })
    end,
  }
}
