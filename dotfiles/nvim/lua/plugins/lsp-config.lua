return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      capabilities.workspace = capabilities.workspace or {}
      capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = true }
      capabilities.workspace.workspaceFolders = true

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })

      vim.lsp.config('lua_ls', {
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
      vim.lsp.enable('lua_ls')

      vim.lsp.config('nil_ls', {
        capabilities = capabilities,
        settings = {
          ["nil"] = {
            formatting = { command = { "alejandra" } },
          },
        },
      })
      vim.lsp.enable('nil_ls')

      local servers = { 'gopls', 'bashls', 'dockerls', 'csharp_ls', 'html', 'cssls', 'jsonls', 'ts_ls', 'basedpyright' }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end

    end,
  }
}
