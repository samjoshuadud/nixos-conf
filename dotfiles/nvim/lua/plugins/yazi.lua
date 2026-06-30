return {
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
    "folke/snacks.nvim",
    opts = {},
  }
}
