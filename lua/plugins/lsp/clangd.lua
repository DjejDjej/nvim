
-- lua/plugins/lsp/clangd.lua
local M = {}

function M.setup(on_attach, capabilities)
  return {
    name = "clangd",
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = function(fname)
      return vim.fs.root(fname, { "compile_commands.json", ".git" })
    end,
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      fallbackFlags = { "-std=c11" },
    },
  }
end

return M
