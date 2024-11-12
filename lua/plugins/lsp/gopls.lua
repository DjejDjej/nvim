
-- plugins/lsp/gopls.lua
local M = {}

M.setup = function(lspconfig, on_attach)
  lspconfig.gopls.setup({
    settings = {
      gopls = {
        analyses = {
          unusedparams = true, -- Warn on unused parameters
          shadow = true,       -- Warn on shadowed variables
        },
        staticcheck = true,     -- Enable static analysis checks
        usePlaceholders = true, -- Show function parameter placeholders
        completeUnimported = true, -- Auto-import packages
      },
    },
    on_attach = on_attach,
  })
end

return M
