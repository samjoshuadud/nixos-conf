-- lua/plugins/colorscheme.lua
--
return {
  -- TokyoNight - Modern dark theme with good contrast
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- storm, moon, or night
        transparent = true, -- important for making the neovim transparent and match with terminal color
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "transparent", -- made this transparent for terminal looking bg 
          floats = "transparent", -- made this transparent for terminal looking bg 
        },
        sidebars = { "qf", "help", "neo-tree" },
        dim_inactive = false,
        lualine_bold = false,
      })
    end,
  },

  -- Catppuccin - Softer, warmer dark theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        dim_inactive = {
          enabled = false,
        },
      })
    end,
  },

  -- Kanagawa - Muted, easy on the eyes
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = false,
        dimInactive = false,
      })
    end,
  },

  -- Nightfox - Deep dark with vibrant accents
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false,
          dim_inactive = false,
        },
      })
    end,
  },

  -- Gruvbox - Classic dark with warm tones
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard", -- soft, medium, hard
        transparent_mode = false,
      })
    end,
  },

  -- Dracula - Dark vampiric theme
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local dracula = require("dracula")
      dracula.setup({
        transparent_bg = false,
        italic_comment = true,
      })
    end,
  },

  -- Mountain - Original minimal theme (keeping it!)
  {
    "TheNiteCoder/mountaineer.vim",
    lazy = false,
    priority = 1000,
  },

  -- Everforest - Similar to Mountain, muted and easy on eyes
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'hard' -- hard, medium, soft
      vim.g.everforest_better_performance = 1
    end,
  },

  -- Gruvbox Material - Softer Gruvbox, Mountain-like
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'hard' -- soft, medium, hard
      vim.g.gruvbox_material_better_performance = 1
    end,
  },

  -- Sonokai - Monokai-inspired with muted tones
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_style = 'andromeda' -- default, atlantis, andromeda, shusia, maia, espresso
      vim.g.sonokai_better_performance = 1
    end,
  },

  -- Rose Pine - Minimal, low-contrast like Mountain
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- auto, main, moon, dawn
        dark_variant = "moon",
      })
    end,
  },

  -- Onedark - Deep, true dark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker", -- dark, darker, cool, deep, warm, warmer
        transparent = false,
      })
      
      -- Load saved theme or use default
      local theme_file = vim.fn.stdpath('data') .. '/last_theme.txt'
      local saved_theme = "tokyonight-night" -- default
      
      -- Try to read saved theme
      local f = io.open(theme_file, 'r')
      if f then
        saved_theme = f:read('*line') or saved_theme
        f:close()
      end
      
      vim.cmd('colorscheme ' .. saved_theme)
      
      -- Create command to switch colorschemes
      vim.api.nvim_create_user_command('Theme', function(opts)
        local theme = opts.args
        local themes = {
          tokyo = "tokyonight-night",
          tokyostorm = "tokyonight-storm",
          tokyomoon = "tokyonight-moon",
          cat = "catppuccin-mocha",
          catfrappe = "catppuccin-frappe",
          kanagawa = "kanagawa-wave",
          kanagawadragon = "kanagawa-dragon",
          carbon = "carbonfox",
          night = "nightfox",
          gruvbox = "gruvbox",
          dracula = "dracula",
          onedark = "onedark",
          onedarkdeep = "onedark",
          mountain = "mountain",
          everforest = "everforest",
          gruvmat = "gruvbox-material",
          sonokai = "sonokai",
          rose = "rose-pine-moon",
          rosemain = "rose-pine-main",
        }
        
        if themes[theme] then
          if theme == "onedarkdeep" then
            require("onedark").setup({ style = "deep" })
          end
          
          -- Save the theme choice
          local theme_file = vim.fn.stdpath('data') .. '/last_theme.txt'
          local f = io.open(theme_file, 'w')
          if f then
            f:write(themes[theme])
            f:close()
          end
          
          vim.cmd("colorscheme " .. themes[theme])
          -- Update lualine theme
          local lualine_themes = {
            tokyo = "tokyonight",
            tokyostorm = "tokyonight",
            tokyomoon = "tokyonight",
            cat = "catppuccin",
            catfrappe = "catppuccin",
            kanagawa = "kanagawa",
            kanagawadragon = "kanagawa",
            carbon = "nightfox",
            night = "nightfox",
            gruvbox = "gruvbox",
            dracula = "dracula",
            onedark = "onedark",
            onedarkdeep = "onedark",
            mountain = "auto",
            everforest = "everforest",
            gruvmat = "gruvbox-material",
            sonokai = "sonokai",
            rose = "rose-pine",
            rosemain = "rose-pine",
          }
          require('lualine').setup({
            options = { theme = lualine_themes[theme] or "auto" }
          })
          print("Switched to " .. themes[theme])
        else
          print("Available themes: tokyo, tokyostorm, tokyomoon, cat, catfrappe, kanagawa, kanagawadragon, carbon, night, gruvbox, dracula, onedark, onedarkdeep, mountain, everforest, gruvmat, sonokai, rose, rosemain")
        end
      end, {
        nargs = 1,
        complete = function()
          return { "tokyo", "tokyostorm", "tokyomoon", "cat", "catfrappe", "kanagawa", "kanagawadragon", "carbon", "night", "gruvbox", "dracula", "onedark", "onedarkdeep", "mountain", "everforest", "gruvmat", "sonokai", "rose", "rosemain" }
        end,
      })
    end,
  },
}
