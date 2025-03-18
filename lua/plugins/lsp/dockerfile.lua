
local M = {}

M.setup = function(lspconfig, on_attach)
  lspconfig.dockerls.setup({
    cmd = { "docker-langserver", "--stdio" }, -- Ensure Dockerfile LSP is used
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Autocompletion support
  })
end

return M
