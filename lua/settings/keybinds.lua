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
  vim.keymap.set("n", "<leader>" .. i, function()
    require("harpoon.ui").nav_file(i)
  end, { desc = "which_key_ignore", silent = true })
end
vim.api.nvim_set_keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true, desc = "Add file to Harpoon" })
vim.api.nvim_set_keymap("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true, desc = "Toggle Harpoon menu" })
vim.api.nvim_set_keymap("n", "<leader>hg", "<cmd>Telescope harpoon marks<CR>", { noremap = true, silent = true, desc = "Show Harpoon marks (Telescope)" })

-- LSP formatting shortcut
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true, desc = "Format document (LSP)" })

-- Oil file explorer shortcut
vim.api.nvim_set_keymap("n", "<Leader>e", ":Oil<CR>", { noremap = true, silent = true, desc = "Open Oil file explorer" })
-- Toggle term 

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true, desc = "Toggle bottom terminal" })

-- LSP navigace a akce pod 'g'

-- Go to definition
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap=true, silent=true, desc="Goto definition" })

-- Go to declaration
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap=true, silent=true, desc="Goto declaration" })

-- Go to implementation
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap=true, silent=true, desc="Goto implementation" })

-- Go to type definition
vim.api.nvim_set_keymap("n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap=true, silent=true, desc="Goto type definition" })

-- Find references (using Telescope for nicer UI)
vim.api.nvim_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", { noremap=true, silent=true, desc="Find references" })

-- Hover info
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap=true, silent=true, desc="Hover info" })

-- Signature help (while typing)
vim.api.nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap=true, silent=true, desc="Signature help" })

-- Rename symbol
vim.api.nvim_set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap=true, silent=true, desc="Rename symbol" })

-- Code actions
vim.api.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap=true, silent=true, desc="Code action" })
