-- lua/plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate", -- This command updates the parsers after installation
    lazy = false, 
    config = function()
      require'nvim-treesitter.config'.setup {
        auto_install = true,
        highlight = {
          enable = true,              -- Enable highlighting
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      }
   end,
  },
}

