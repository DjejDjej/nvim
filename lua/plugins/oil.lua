
return {

{
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".." or name == ".git"
          end,
        },
	 lsp_file_methods = {
    -- Enable or disable LSP file operations
    enabled = true,
    -- Time to wait for LSP file operations to complete before skipping
    timeout_ms = 1000,
    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
    -- Set to "unmodified" to only save unmodified buffers
    autosave_changes = false,
  },
columns = {
    "icon",
   -- "permissions",
     "size",
    -- "mtime",
  },

  keymaps = {
    ["<leader>gp"] = "actions.preview",
    ["<leader>gc"] = "actions.close",
    ["<leader>gr"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["<leader>gs"] = "actions.change_sort",
    ["<leader>gx"] = "actions.open_external",
    ["<leader>g."] = "actions.toggle_hidden",
  },

        float = {
          padding = 2,
          max_width = 90,
          max_height = 0,
        },
        win_options = {
          wrap = true,
          winblend = 0,
        },
      })
    end,
  },
}
