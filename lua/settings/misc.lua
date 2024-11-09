-- Define a command :Rp to replace 'string1' with 'string2'
vim.api.nvim_create_user_command(
    'Rp',
    function(opts)
        local find = opts.args:match("^(%S+)")
        local replace = opts.args:match("%s+(.+)$")
        if find and replace then
            vim.cmd(":%s/" .. vim.fn.escape(find, "/") .. "/" .. vim.fn.escape(replace, "/") .. "/g")
        else
            print("Usage: :Rp <string1> <string2>")
        end
    end,
    { nargs = 1, complete = 'custom,v:lua.custom_complete' }
)

vim.keymap.set('n', '<leader>o', function()
  local api = require('nvim-tree.api')
  local view = require('nvim-tree.view')
  if view.is_visible() then
    if vim.fn.bufname() == "NvimTree_" .. vim.api.nvim_get_current_tabpage() then
      vim.cmd('wincmd p')
    else
      api.tree.focus()
    end
  else
    vim.cmd('NvimTreeToggle')
  end
end, { noremap = true, silent = true, desc = "Focus NvimTree" })


