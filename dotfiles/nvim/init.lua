vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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

require("config.lazy")

vim.opt.fillchars = { eob = ' ' }

vim.api.nvim_set_keymap('n', '<leader>ac', ':lua toggle_autocompletion()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ee', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

vim.keymap.set("i", "jk", "<Esc>", { silent = true })
vim.keymap.set("i", "kj", "<Esc>", { silent = true })

vim.keymap.set("n", "<ESC>", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>d", ":copy .<CR>", { desc = "Duplicate current line" })

vim.keymap.set("n", "<leader>m", function()
  local mark = vim.fn.nr2char(vim.fn.getchar())
  vim.cmd("delmarks " .. mark)
end)

vim.keymap.set('n', 'gD', '<CMD>Glance definitions<CR>')
vim.keymap.set('n', 'gR', '<CMD>Glance references<CR>')
vim.keymap.set('n', 'gY', '<CMD>Glance type_definitions<CR>')
vim.keymap.set('n', 'gM', '<CMD>Glance implementations<CR>')

vim.keymap.set("n", "<leader>r", "<cmd>Yazi resume<CR>")

