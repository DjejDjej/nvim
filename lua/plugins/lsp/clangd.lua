-- plugins/lsp/clangd.lua
local M = {}

M.setup = function(lspconfig, on_attach)
  lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index" }, -- Ensure clangd is used
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(), -- for autocompletion
    init_options = {
      fallbackFlags = { "-std=c11" }, -- Set the default standard for C
    },
  })
end

return M

