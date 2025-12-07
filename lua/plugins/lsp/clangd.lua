
local M = {}

M.setup = function(on_attach, capabilities)
  return {
    name = "clangd",
    cmd = { "clangd", "--background-index" },

    filetypes = { "c", "cpp", "objc", "objcpp" },

    -- New Neovim 0.11 root detection
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
