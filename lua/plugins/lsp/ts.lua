
local M = {}

M.setup = function(lspconfig, on_attach)
  lspconfig.tsserver.setup({
    cmd = { "typescript-language-server", "--stdio" }, -- Ensure tsserver is used
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Autocompletion support
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
    },
    init_options = {
      preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
      },
    },
  })
end

return M
