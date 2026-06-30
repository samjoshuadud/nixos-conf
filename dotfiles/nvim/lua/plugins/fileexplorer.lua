-- return {
-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		tag = "0.1.8",
-- 		dependencies = { "nvim-lua/plenary.nvim" },
-- 		config = function()
-- 			local builtin = require("telescope.builtin")
-- 			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- 			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
-- 		end,
-- 	},
-- 	{
-- 		"nvim-telescope/telescope-ui-select.nvim",
-- 		config = function()
-- 			require("telescope").setup({
-- 				extensions = {
-- 					["ui-select"] = {
-- 						require("telescope.themes").get_dropdown({}),
-- 					},
-- 				},
-- 			})
-- 			require("telescope").load_extension("ui-select")
-- 		end,
-- 	},
-- }

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
}

