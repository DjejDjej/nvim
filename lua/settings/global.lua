vim.o.clipboard = "unnamedplus"
vim.opt.title = true
vim.g.mapleader = " "
vim.opt.fillchars = 'eob: '
vim.opt.fillchars.eob = ' '
vim.opt.autochdir = true
vim.opt.number = true          -- Shows absolute line numbers
vim.opt.relativenumber = true  -- Shows relative line numbers
vim.opt.cmdheight = 0
vim.opt.mouse = ''
vim.o.showtabline = 1
-- Enable undofile
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
-- Set the directory for undo files (optional)
vim.opt.undodir = os.getenv("HOME") .. "/.config/.undodir"  -- Change the path if necessary

vim.o.wrap = true

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local file_name = vim.fn.expand("%:t")  -- Get the file name (just the name, not the full path)
        if file_name == "" then
            file_name = "[No Name]"            -- Default title when no file is open
        end
        vim.opt.titlestring = "nvim - " .. file_name
    end
})


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


-- Autocommand to disable sign column in Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.signcolumn = "no"
  end,
})






vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
