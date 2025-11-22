
return {

  ---------------------------------------------------------------------------
  -- Core LSP
  ---------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
      -----------------------------------------------------------------------
      -- Basic diagnostic settings
      -----------------------------------------------------------------------
      vim.diagnostic.config({
        virtual_text = false,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        -- Formatting key
        vim.api.nvim_buf_set_keymap(
          bufnr,
          "n",
          "<leader>l",
          "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
          { noremap = true, silent = true }
        )

        -- Disable inlay hints if present
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint(bufnr, false)
        end
      end

      -----------------------------------------------------------------------
      -- LSP Servers
      -----------------------------------------------------------------------
      local servers = { "clangd" }

      for _, name in ipairs(servers) do
        local ok, mod = pcall(require, "plugins.lsp." .. name)
        if not ok then
          vim.notify("Missing LSP config for: " .. name, vim.log.levels.ERROR)
        else
          local cfg = mod.setup(on_attach, capabilities)

          -- Convert filetypes table to comma-separated string for autocmd
          local ft_pattern = table.concat(cfg.filetypes, ",")

          vim.api.nvim_create_autocmd("FileType", {
            pattern = ft_pattern,
            callback = function(args)
              local bufnr = args.buf
              -- Prevent duplicate clients
              local active = vim.lsp.get_clients({ bufnr = bufnr, name = cfg.name })
              if #active == 0 then
                vim.lsp.start(cfg)
              end
            end,
          })
        end
      end
    end
  },

  ---------------------------------------------------------------------------
  -- LSP UI: Lspsaga
  ---------------------------------------------------------------------------
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = { enable = false },
        diagnostic = { on_insert = false, show_source = true },
        ui = { border = "rounded" },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Autocompletion: nvim-cmp
  ---------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),  -- Manual trigger
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Up>'] = cmp.mapping.select_prev_item(),
          ['<Down>'] = cmp.mapping.select_next_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "luasnip" },
          { name = "path", trailing_slash = true },
        }),
        completion = {
          autocomplete = false,  -- Disable automatic popup
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = function(_, vim_item)
            vim_item.abbr = vim_item.abbr:gsub("💡%d+", "")
            vim_item.abbr = vim_item.abbr:gsub("%$%d+", "")
            vim_item.abbr = string.sub(vim_item.abbr, 1, 40)
            return vim_item
          end,
        },
      })

      -- Buffer search completion
      cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })
    end,
  },

  ---------------------------------------------------------------------------
  -- Snippet Engine
  ---------------------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  ---------------------------------------------------------------------------
  -- Autocompletion capability bridge
  ---------------------------------------------------------------------------
  { "hrsh7th/cmp-nvim-lsp" },
}
