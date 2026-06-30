return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")

      fzf.setup({
        winopts = {
          border = "rounded",
          preview = {
            default = "bat",
          },
        },
      })

      vim.keymap.set("n", "<C-p>", fzf.files, {})
      vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "fzf-lua live grep" })
    end,
  },
  {
    'dnlhc/glance.nvim',
    cmd = 'Glance'
  }
}
