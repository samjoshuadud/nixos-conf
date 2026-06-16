return {
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --     -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  --   },
  --
  --   config = function()
  --     -- Keymap to toggle Neotree with <C-n>
  --     vim.keymap.set('n', '<C-n>', function()
  --       for _, win in ipairs(vim.api.nvim_list_wins()) do
  --         local buf = vim.api.nvim_win_get_buf(win)
  --         local buf_ft = vim.api.nvim_buf_get_option(buf, 'filetype')
  --         if buf_ft == 'neo-tree' then
  --           vim.cmd("Neotree close")
  --           return
  --         end
  --       end
  --       vim.cmd("Neotree")
  --     end, {})
  --
  --     -- Neotree setup with hidden files visible
  --     require('neo-tree').setup({
  --       filesystem = {
  --         filtered_items = {
  --           visible = true,      -- Make hidden files visible
  --           hide_dotfiles = false, -- Do not hide dotfiles (e.g., .gitignore, .zshrc)
  --           show_hidden_count = true, -- Show count of hidden files
  --         }
  --       }
  --     })
  --   end
  -- }
  --
  {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<C-n>",
      "<cmd>Yazi<cr>",
      desc = "Open Yazi",
    },
  },
},
{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
},
{
  "folke/snacks.nvim",
  opts = {},
}
}
