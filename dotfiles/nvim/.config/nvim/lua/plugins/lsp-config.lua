return {
  { 
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    opts = {
      auto_install = false, 
    },
  },

  { 
    "neovim/nvim-lspconfig",
    lazy=false,
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      capabilities.workspace = capabilities.workspace or {}
      capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = true }
      capabilities.workspace.workspaceFolders = true

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })

      -- Nix Language Server
      lspconfig.nil_ls.setup({
        capabilities = capabilities,
        settings = {
          ["nil"] = {
            formatting = { command = { "alejandra" } },
          },
        },
      })

      -- Lua Language Server
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      })

      lspconfig.csharp_ls.setup({ capabilities = capabilities })

      lspconfig.tailwindcss.setup({ capabilities = capabilities })

      lspconfig.basedpyright.setup({ capabilities = capabilities })

      lspconfig.phpactor.setup({ capabilities = capabilities })

      lspconfig.ts_ls.setup({ capabilities = capabilities })
      
      lspconfig.ast_grep.setup({ capabilities = capabilities })

    end,
  }
}
