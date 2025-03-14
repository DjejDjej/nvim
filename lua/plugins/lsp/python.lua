local M = {}

M.setup = function(lspconfig, on_attach)
  lspconfig.pyright.setup({
    cmd = { "pyright-langserver", "--stdio" }, -- Ensure Pyright is used
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(), -- for autocompletion
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
  })
end

return M
