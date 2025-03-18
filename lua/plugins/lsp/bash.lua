
local M = {}

M.setup = function(lspconfig, on_attach)
  lspconfig.bashls.setup({
    cmd = { "bash-language-server", "start" }, -- Ensure Bash LSP is used
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Autocompletion support
    filetypes = { "sh", "bash", "zsh" }, -- Support for shell script files
  })
end

return M
