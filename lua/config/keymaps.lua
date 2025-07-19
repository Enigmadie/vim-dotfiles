-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.del("n", "<leader>e")
vim.keymap.del("n", "<leader><leader>")

vim.keymap.set("n", "<leader><leader>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })

vim.keymap.set("n", "<leader>e", "<cmd>Telescope find_files<cr>", { desc = "Find Files (Telescope)" })

-- vim.keymap.del("n", "s")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save File" })

vim.keymap.set("n", "<C-n>", function()
  require("neo-tree.command").execute({ reveal = true, reveal_force_cwd = true })
end, { noremap = true, silent = true, desc = "Toggle NeoTree and focus current file" })
-- vim.keymap.set("n", "<C-n>", "<C-w>w", { noremap = true, silent = true })
