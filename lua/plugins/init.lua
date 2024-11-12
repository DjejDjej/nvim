return {
  -- Load theme configuration
  require("plugins.theme"),

  -- Load oil.nvim for file management
  require("plugins.oil"),

  -- Load Language Server Protocol (LSP) configuration
  require("plugins.lsp"),

  -- Load Treesitter for advanced syntax highlighting and parsing
  require("plugins.treesitter"),

  -- Load lualine.nvim for customizable statusline
  require("plugins.lualine"),


  -- Load alpha-nvim for start screen customization
  require("plugins.alpha-nvim"),

  -- Load telescope for fuzzy finding and searching
  require("plugins.telescope"),

  -- Load which-key for displaying available keybindings
  require("plugins.whichkey"),

  -- Load nvim-colorizer for color highlighting
  require("plugins.nvim-colorizer"),

  -- Load presence.nvim for Discord Rich Presence integration
  require("plugins.presence"),

  -- Load surround.nvim for easy text surrounding manipulations
  require("plugins.surround"),

  -- Load toggleterm.nvim for in-editor terminal management
  require("plugins.toggleterm"),

  -- Load dressing.nvim for improved input and select UI
  require("plugins.dressing"),

  -- Load comment.nvim for enhanced commenting functionality
  require("plugins.comment"),

  -- Load ts-rainbow for rainbow-colored brackets in Treesitter
  require("plugins.ts-rainbow"),

  -- Load symbols-outline.nvim for symbol outline sidebar
  require("plugins.symbols-outline"),

  -- Load lsp_signature.nvim for signature help in LSP
  require("plugins.lsp-signature"),

  -- Load nicer command prompt  
  require("plugins.noice"),

  -- Load markdown support
  require("plugins.markdown"),


 -- Load harpoon
  require("plugins.harpoon"),
}
