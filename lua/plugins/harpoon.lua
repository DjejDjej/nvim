return {
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Ensure the dependency is listed
    opts = {
      global_settings = { -- Global settings should be within opts for Harpoon
        save_on_change = true,
      },
    },
    config = function(_, opts)
      -- Set up Harpoon with the provided options
      require("harpoon").setup(opts)

      -- Load the Harpoon extension if using Telescope
      if pcall(require, "telescope") then
        require("telescope").load_extension("harpoon")
      end
    end,
  },
}

