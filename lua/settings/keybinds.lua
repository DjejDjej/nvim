-- Remap normal and visual mode delete commands to use black hole register
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true })
vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true })
vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true })
vim.api.nvim_set_keymap('n', 's', '"_s', { noremap = true })
-- better ctrl u and d
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true, silent = true })
-- Key mapping to toggle the nvim-tree file explorer
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':nohlsearch<CR>', { noremap = true, silent = true })
-- Key mapping to switch focus between nvim-tree and the text window
vim.keymap.set('n', '<leader>o', function()
  local api = require('nvim-tree.api')
  local view = require('nvim-tree.view')




  if view.is_visible() then
    if vim.fn.bufname() == "NvimTree_" .. vim.api.nvim_get_current_tabpage() then
      -- If nvim-tree is focused, switch to the previous window
      vim.cmd('wincmd p')
    else
      -- If another window is focused, switch focus to nvim-tree
      api.tree.focus()
    end
  else
    -- If nvim-tree is not open, open it
    vim.cmd('NvimTreeToggle')
  end
end, { noremap = true, silent = true, desc = "Focus tree" })

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
-- Keybinding for killing terminal using Ctrl+D
vim.api.nvim_set_keymap('n', '<leader>sf', ':set filetype=sh<CR>', { noremap = true, silent = true })
vim.api.nvim_command('command! Q q!')

-- Make :Q behave like :q!
vim.api.nvim_command('command! -nargs=0 Q q!')

-- Make :WQ behave like :wq
vim.api.nvim_command('command! -nargs=0 WQ wq')


vim.api.nvim_set_keymap('n', '<Leader>t', '<Cmd>ToggleTerm<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-d>', [[<C-\><C-n><Cmd>bd!<CR>]], { noremap = true, silent = true })

-- Disable arrow keys
--vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })




vim.opt.mouse = ''
