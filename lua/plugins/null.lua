
return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "VeryLazy",  -- adjust the event if you prefer a different lazy-loading trigger
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Formatting sources:
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        -- You can add diagnostics or code actions as needed:
        null_ls.builtins.diagnostics.eslint,
      },
    })
  end,
}
