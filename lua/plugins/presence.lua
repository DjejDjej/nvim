return {
  {
    "andweeb/presence.nvim",
    event = "VeryLazy", -- Lazy load to avoid performance issues on startup
    config = function()
      require("presence"):setup({
        auto_update         = true,  -- Auto-update Discord status
        neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
        main_image          = "neovim", -- Set to 'neovim' to use the Neovim logo
        log_level           = nil,    -- Log level for messages (debug, info, warn, error)
        buttons             = true,                      



        -- Rich presence settings for different activities
        editing_text        = "Editing %s", -- Shows when editing a file
        file_explorer_text  = "Browsing %s", -- Shows when browsing files
        git_commit_text     = "Committing changes", -- Shows when committing to git
        plugin_manager_text = "Managing plugins", -- Shows when using a plugin manager
        reading_text        = "Reading %s", -- Shows when reading a file
        workspace_text      = "Working on %s", -- Shows when working on a project
        line_number_text    = "Line %s out of %s", -- Displays current line and total lines
      })
    end,
  }
}

