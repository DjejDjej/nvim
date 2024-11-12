return {
  "CRAG666/code_runner.nvim",
  event = "VeryLazy", -- Lazy load to improve startup performance
  config = function()
    require("code_runner").setup({
      mode = "toggleterm", -- Use toggleterm for embedded terminal output
      focus = false,        -- Focus on the terminal after running the command
      filetype = {
        c = "clear && gcc % -o %:r && ./%:r",              -- Compile and run C files
        go = "clear && go run .",              -- Compile and run C files
        python = "clear && python3 %",                     -- Run Python files
      },
    })
  end,
}
