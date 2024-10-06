return {
  "zegl/kube-score",
  event = "VeryLazy", -- Lazy load to avoid performance issues on startup
  config = function()
    -- Optional: Set default output format for Kube-score
    vim.g.kube_score_default_format = "yaml"

    -- Create a command to run Kube-score on the current buffer
    vim.api.nvim_create_user_command('KubeScore', function()
      local filename = vim.fn.expand('%')  -- Get the current file name
      local filetype = vim.fn.expand('%:e')  -- Get the file extension

      -- Check if the file is a YAML file
      if filetype ~= "yaml" and filetype ~= "yml" then
        return
      end

      -- Open a terminal buffer and run Kube-score
      vim.cmd('terminal kube-score score ' .. filename)
    end, { desc = "Run Kube-score on the current buffer" })

    -- Key mapping for <Leader>sk to trigger KubeScore command
    vim.api.nvim_set_keymap('n', '<Leader>sk', ':KubeScore<CR>', { noremap = true, silent = true })
  end,
}

