
local M = {}

M.setup = function(lspconfig, on_attach)
  lspconfig.ts_ls.setup({
    cmd = { "typescript-language-server", "--stdio" },
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
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
