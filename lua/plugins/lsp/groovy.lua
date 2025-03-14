-- plugins/lsp/groovy.lua
local M = {}

M.setup = function(lspconfig, on_attach)
  lspconfig.groovyls.setup({
    cmd = { "java", "-jar", "/usr/share/java/groovy-language-server/groovy-language-server-all.jar" },
    filetypes = { "groovy", "gradle" },
    root_dir = lspconfig.util.root_pattern("build.gradle", "settings.gradle", ".git"),
    settings = {
      groovy = {
        -- Add any Groovy-specific settings here
      },
    },
    on_attach = on_attach,
  })
end

return M
