
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      git = {
        enable = true,
      },
      renderer = {
        highlight_opened_files = "all",
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            git = true,
          },
        },
      },
      view = {
        width = 30,
        side = "left",
      },
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Existing key mappings
        vim.keymap.set('n', 'f', api.tree.change_root_to_node, opts('Focus Folder')) -- Bind 'f' key to set folder as root
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open File'))  -- Bind Enter key to open file
        vim.keymap.set('n', 'n', api.fs.create, opts('Create New File'))      -- Bind 'n' key to create new file

        -- New Shift+Enter mapping to open file in a new tab
        vim.keymap.set('n', '<S-CR>', api.node.open.tab, opts('Open in New Tab'))
      end,
      filters = {
        dotfiles = false,
      },
    })

    vim.cmd([[highlight NvimTreeRootFolder guifg=#00BFFF ]])
    vim.cmd([[highlight NvimTreeNormal guibg=#1a1d23]])
  end,
}
