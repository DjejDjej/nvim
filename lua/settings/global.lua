vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.fillchars = 'eob: '

vim.opt.fillchars.eob = ' '

vim.opt.number = true          -- Shows absolute line numbers
vim.opt.relativenumber = true  -- Shows relative line numbers
vim.opt.cmdheight = 0



-- Enable undofile
vim.opt.undofile = true

-- Set the directory for undo files (optional)
vim.opt.undodir = os.getenv("HOME") .. "/.config/.undodir"  -- Change the path if necessary

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch", -- You can change this to any highlight group you prefer
      timeout = 300, -- Duration of the highlight in milliseconds
    })
  end,
})
