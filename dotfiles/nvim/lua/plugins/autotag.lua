return {
  { 
    'windwp/nvim-ts-autotag', 
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter.config').setup {
        autotag = {
          enable = true,
        },
      }
    end,
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  -- {
  --   'romgrk/barbar.nvim',
  --   config = function()
  --     require('barbar').setup {
  --       -- Add your Barbar configuration options here
  --     }
  --   end,
  -- },
  {
    'lukas-reineke/indent-blankline.nvim',
  },
}

