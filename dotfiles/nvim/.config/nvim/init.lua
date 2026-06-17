vim.cmd("set expandtab")     -- Use spaces instead of tabs
vim.cmd("set tabstop=2")     -- Number of spaces that a <Tab> counts for
vim.cmd("set softtabstop=2") -- Number of spaces that a <Tab> counts for while editing
vim.cmd("set shiftwidth=2")  -- Number of spaces to use for each step of (auto)indent

-- Set leader key to space
vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true


vim.keymap.set("n", "<leader>n", function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.wo.number = true
    print("Absolute line numbers enabled")
  else
    vim.wo.relativenumber = true
    vim.wo.number = true
    print("Relative line numbers enabled")
  end
end, { desc = "Toggle relative/absolute line numbers" })
-- Enable line numbers
-- vim.wo.number = true -- Enable absolute line numbers
-- vim.wo.relativenumber = true   -- Enable relative line numbers

-- Importing plugins
require("config.lazy")         -- Lazy loading config
-- Switch to different window
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Remove ~ in nvim
vim.opt.fillchars = { eob = ' ' } -- Replace empty lines with space

-- Colorscheme is now loaded via plugins/colorscheme.lua
--
-- Buffer management key mappings
vim.keymap.set('n', '<C-A-l>', ':BufferNext<CR>', { noremap = true, silent = true })    -- Go to the next buffer
vim.keymap.set('n', '<C-A-h>', ':BufferPrevious<CR>', { noremap = true, silent = true }) -- Go to the previous buffer
vim.keymap.set('n', '<C-A-BS>', ':BufferClose<CR>', { noremap = true, silent = true })      -- Close the current buffer

vim.api.nvim_set_keymap('n', '<leader>ac', ':lua toggle_autocompletion()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ee', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

vim.keymap.set("i", "jk", "<Esc>", { silent = true })
vim.keymap.set("i", "kj", "<Esc>", { silent = true })

vim.keymap.set("n", "<ESC>", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>d", ":copy .<CR>", { desc = "Duplicate current line" })


--- Instant remove of marks
vim.keymap.set("n", "<leader>m", function()
  local mark = vim.fn.nr2char(vim.fn.getchar())
  vim.cmd("delmarks " .. mark)
end)

vim.keymap.set('n', 'gD', '<CMD>Glance definitions<CR>')
vim.keymap.set('n', 'gR', '<CMD>Glance references<CR>')
vim.keymap.set('n', 'gY', '<CMD>Glance type_definitions<CR>')
vim.keymap.set('n', 'gM', '<CMD>Glance implementations<CR>')

vim.keymap.set("n", "<leader>r", "<cmd>Yazi resume<CR>")
