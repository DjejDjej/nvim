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
-- Key mapping to toggle the nvim-tree file explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


-- Key mapping to switch focus between nvim-tree and the text window
vim.keymap.set('n', '<leader>o',function()
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
end, { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
 vim.api.nvim_set_keymap('n', '<Leader>t', '<Cmd>lua toggle_term_and_buffer()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Leader>t', [[<C-\><C-n><Cmd>wincmd p<CR>]], { noremap = true, silent = true })
-- Keybinding for killing terminal using Ctrl+D
vim.api.nvim_set_keymap('t', '<C-d>', [[<C-\><C-n><Cmd>bd!<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sf', ':set filetype=sh<CR>', { noremap = true, silent = true })
