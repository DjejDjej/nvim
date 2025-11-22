-- Keymap Settings

-- Remap delete, change, cut, and substitute commands to use the black hole register (i.e. without yanking)
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true, desc = "Delete without yank (normal)" })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, desc = "Delete without yank (visual)" })
vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true, desc = "Change without yank (normal)" })
vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true, desc = "Change without yank (visual)" })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, desc = "Cut without yank (normal)" })
vim.api.nvim_set_keymap('n', 's', '"_s', { noremap = true, desc = "Substitute without yank (normal)" })

-- Better scrolling: center screen after <C-u>/<C-d>
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = "Scroll up and center" })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = "Scroll down and center" })

-- Disable arrow keys and command-line shortcuts
vim.api.nvim_set_keymap('n', '<Up>',    '<Nop>', { noremap = true, silent = true, desc = "Disable Up arrow" })
vim.api.nvim_set_keymap('n', '<Down>',  '<Nop>', { noremap = true, silent = true, desc = "Disable Down arrow" })
vim.api.nvim_set_keymap('n', '<Left>',  '<Nop>', { noremap = true, silent = true, desc = "Disable Left arrow" })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true, desc = "Disable Right arrow" })

-- Disable q: and Q: suggestions 
vim.api.nvim_set_keymap('n', 'q:', '<Nop>', { noremap = true, silent = true, desc = "Disable q:" })
vim.api.nvim_set_keymap('n', 'Q:', '<Nop>', { noremap = true, silent = true, desc = "Disable Q:" })

-- Center search results with 'n' and 'N'
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true, silent = true, desc = "Next search result centered" })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true, silent = true, desc = "Previous search result centered" })
vim.api.nvim_set_keymap('n', '<leader>C', ':nohlsearch<CR>', { noremap = true, silent = true, desc = "Clear search highlights" })

-- Telescope mappings for file search and live grep
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true, desc = "Find files (Telescope)" })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true, desc = "Live grep (Telescope)" })

-- Set filetype to shell script
vim.api.nvim_set_keymap('n', '<leader>sf', ':set filetype=sh<CR>', { noremap = true, silent = true, desc = "Set filetype to sh" })

-- Quick commands for quitting and writing
vim.api.nvim_command('command! Q qa!')
vim.api.nvim_command('command! -nargs=0 WQ wqa!')
vim.api.nvim_command('command! -nargs=0 Wq wqa!')

-- Diagnostic and SymbolsOutline mappings
vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true, desc = "Open diagnostics float" })
vim.api.nvim_set_keymap("n", "<leader>sS", ":SymbolsOutline<CR>", { noremap = true, silent = true, desc = "Toggle Symbols Outline" })

-- Harpoon mappings
for i = 1, 9 do
  vim.api.nvim_set_keymap("n", "<C-" .. i .. ">", ":lua require('harpoon.ui').nav_file(" .. i .. ")<CR>", { noremap = true, silent = true, desc = "Navigate to Harpoon file " .. i })
end
vim.api.nvim_set_keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true, desc = "Add file to Harpoon" })
vim.api.nvim_set_keymap("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true, desc = "Toggle Harpoon menu" })
vim.api.nvim_set_keymap("n", "<leader>hg", "<cmd>Telescope harpoon marks<CR>", { noremap = true, silent = true, desc = "Show Harpoon marks (Telescope)" })

-- LSP formatting shortcut
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true, desc = "Format document (LSP)" })

-- Oil file explorer shortcut
vim.api.nvim_set_keymap("n", "<Leader>e", ":Oil<CR>", { noremap = true, silent = true, desc = "Open Oil file explorer" })



vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true, desc = "Toggle bottom terminal" })
