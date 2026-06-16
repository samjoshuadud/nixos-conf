-- Define a global toggle variable
local autocompletion_enabled = false

-- Define a function to toggle autocompletion and Copilot
_G.toggle_autocompletion = function()
  autocompletion_enabled = not autocompletion_enabled
  if autocompletion_enabled then
    vim.cmd("Copilot enable")  -- Enable Copilot
  else
    vim.cmd("Copilot disable") -- Disable Copilot
  end
  print("Autocompletion " .. (autocompletion_enabled and "Enabled" or "Disabled"))
end

vim.defer_fn(function()
  vim.cmd("Copilot disable")
end, 100)

return {
  -- {
  --   "olimorris/codecompanion.nvim",
  --   opts = {},
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("codecompanion").setup({
  --       strategies = {
  --         chat = {
  --           adapater = "copilot",
  --         },
  --         inline = {
  --           adapter = "copilot",
  --         },
  --         agent = {
  --           adapter = "copilot",
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'github/copilot.vim'
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    }
  },
  -- {
  --   'tzachar/cmp-tabnine',
  --   build = './install.sh',
  --   dependencies = 'hrsh7th/nvim-cmp',
  -- },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require 'cmp'
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        enabled = function()
          return autocompletion_enabled -- Enable based on the toggle
        end,
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'nvim_lua' },
          { name = 'buffer' },
          { name = 'cmp_tabnine' },
        })
      })
    end,
  }
}
