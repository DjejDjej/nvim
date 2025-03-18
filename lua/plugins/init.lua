return {
  -- Load theme configuration
  require("plugins.theme"),
  
  -- File management
  require("plugins.oil"),
  
  -- Language Server Protocol (LSP) configuration
  require("plugins.lsp"),
  
  -- Syntax highlighting and parsing
  require("plugins.treesitter"),
  
  -- Customizable statusline
  require("plugins.lualine"),
  
  -- Start screen customization
  require("plugins.alpha-nvim"),
  
  -- Fuzzy finding and searching
  require("plugins.telescope"),
  
  -- Display available keybindings
  require("plugins.whichkey"),
  
  -- Color highlighting
  require("plugins.nvim-colorizer"),
  
  -- Discord Rich Presence integration
  require("plugins.presence"),
  
  -- Easy text surrounding manipulations
  require("plugins.surround"),
  
  -- Improved input and select UI
  require("plugins.dressing"),
  
  -- Enhanced commenting functionality
  require("plugins.comment"),
  
  -- Symbol outline sidebar
  require("plugins.symbols-outline"),
  
  -- Signature help in LSP
  require("plugins.lsp-signature"),
  
  -- Nicer command prompt
  require("plugins.noice"),
  
  -- Markdown support
  require("plugins.markdown"),
  
  -- Harpoon for quick navigation
  require("plugins.harpoon"),
}
