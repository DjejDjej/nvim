
-- Remap delete/change commands to use black hole register
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true, desc = "Delete without yank (normal)" })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, desc = "Delete without yank (visual)" })
vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true, desc = "Change without yank (normal)" })
vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true, desc = "Change without yank (visual)" })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, desc = "Cut without yank (normal)" })
vim.api.nvim_set_keymap('n', 's', '"_s', { noremap = true, desc = "Substitute without yank (normal)" })

-- Better Scrolling (center screen)
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = "Scroll up and center" })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = "Scroll down and center" })

-- Disable Arrow Keys
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true, desc = "Disable Up arrow" })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true, desc = "Disable Down arrow" })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true, desc = "Disable Left arrow" })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true, desc = "Disable Right arrow" })

-- Disable Ex commands shortcuts
vim.api.nvim_set_keymap('n', 'Q:', '<Nop>', { noremap = true, silent = true, desc = "Disable Q:" })
vim.api.nvim_set_keymap('n', 'q:', '<Nop>', { noremap = true, silent = true, desc = "Disable q:" })

-- Center Search Results
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true, silent = true, desc = "Next search result centered" })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true, silent = true, desc = "Previous search result centered" })
vim.api.nvim_set_keymap('n', '<leader>C', ':nohlsearch<CR>', { noremap = true, silent = true, desc = "Clear search highlights" })

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true, desc = "Find files (Telescope)" })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true, desc = "Live grep (Telescope)" })

-- Filetype Helpers
vim.api.nvim_set_keymap('n', '<leader>us', ':set filetype=sh<CR>', { noremap = true, silent = true, desc = "Set filetype to sh" })

-- Custom Commands Shortcuts
vim.api.nvim_command('command! Q qa!')
vim.api.nvim_command('command! -nargs=0 WQ wqa!')
vim.api.nvim_command('command! -nargs=0 Wq wqa!')

-- Symbol Outline
vim.api.nvim_set_keymap("n", "<leader>sS", ":SymbolsOutline<CR>", { noremap = true, silent = true })

-- Harpoon Keybindings
for i = 1, 9 do
    vim.api.nvim_set_keymap("n", "<C-" .. i .. ">", ":lua require('harpoon.ui').nav_file(" .. i .. ")<CR>", { noremap = true, silent = true })
end
vim.api.nvim_set_keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>hg", "<cmd>Telescope harpoon marks<CR>", { noremap = true, silent = true })

-- Diagnostics
vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- LSP
vim.api.nvim_set_keymap("n", "<leader>ul", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })

-- LSPSaga shortcuts
vim.keymap.set("n", "<leader>l f", "<cmd>Lspsaga lsp_finder<CR>", opts)        -- Finder
vim.keymap.set("n", "<leader>l a", "<cmd>Lspsaga code_action<CR>", opts)       -- Code Action
vim.keymap.set("n", "<leader>l r", "<cmd>Lspsaga rename<CR>", opts)            -- Rename
vim.keymap.set("n", "<leader>l p", "<cmd>Lspsaga peek_definition<CR>", opts)   -- Peek Definition

-- Oil (File Explorer)
vim.api.nvim_set_keymap("n", "<Leader>e", ":Oil<CR>", { noremap = true, silent = true })
