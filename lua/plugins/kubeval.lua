return {
  "instrumenta/kubeval",
  event = "VeryLazy", -- Lazy load to avoid performance issues on startup
  config = function()
    local function validate_with_kubeval()
      local filename = vim.fn.expand('%')
      local handle = io.popen('kubeval ' .. filename)
      local result = handle:read("*a")
      handle:close()

      -- Check if Kubeval produced any output
      if result ~= "" then
        -- Parse the result to extract severity
        local severity_lines = {}

        for line in result:gmatch("[^\r\n]+") do
          -- Check for "ERR" or "WARN" in the line
          if line:match("^ERR") then
            table.insert(severity_lines, "Error: " .. line)  -- Prepend "Error:" for clarity
          elseif line:match("^WARN") then
            table.insert(severity_lines, "Warning: " .. line)  -- Prepend "Warning:" for clarity
          end
        end

        -- Notify based on severity findings
        if #severity_lines > 0 then
          vim.notify(table.concat(severity_lines, "\n"), "error")  -- Display errors as notifications
        end
      end
    end

    -- Create a user command for Kubeval
    vim.api.nvim_create_user_command('Kubeval', validate_with_kubeval, { desc = "Validate current buffer with Kubeval" })

    -- Set up an autocommand to validate on save
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.yaml,*.yml",
      callback = validate_with_kubeval,
      desc = "Validate Kubernetes YAML files on save"
    })
  end,
}

