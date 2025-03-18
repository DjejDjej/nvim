-- General Options & Autocommands

-- Basic settings
vim.o.clipboard = "unnamedplus"         -- Use system clipboard
vim.opt.title = true                    -- Enable window title
vim.g.mapleader = " "                   -- Leader key set to space
vim.opt.fillchars = 'eob: '             -- Fill characters for end-of-buffer
vim.opt.fillchars.eob = ' '
vim.opt.autochdir = true                -- Auto change directory to current file's path
vim.opt.number = true                   -- Absolute line numbers
vim.opt.relativenumber = true           -- Relative line numbers
vim.opt.cmdheight = 0                   -- Minimal command line height
vim.opt.mouse = ''                      -- Disable mouse
vim.o.showtabline = 1                   -- Show tabline if tabs exist

-- Backup, swap, and undo settings
vim.opt.undofile = true                -- Enable persistent undo
vim.opt.backup = false                 -- Disable backups
vim.opt.swapfile = false               -- Disable swap files
vim.opt.signcolumn = "yes"             -- Always show sign column
vim.opt.undodir = os.getenv("HOME") .. "/.config/.undodir"  -- Undo directory

-- Text wrapping
vim.o.wrap = true                      -- Enable line wrapping

-- Autocommand: Update title with current file name
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local file_name = vim.fn.expand("%:t")
    if file_name == "" then file_name = "[No Name]" end
    vim.opt.titlestring = "nvim - " .. file_name
  end
})

-- Autocommand: Highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch", timeout = 300,
    })
  end,
})

-- Autocommand: Disable sign column for Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.signcolumn = "no"
  end,
})

-- User command: :Rp to perform a global find/replace
vim.api.nvim_create_user_command('Rp', function(opts)
  local find = opts.args:match("^(%S+)")
  local replace = opts.args:match("%s+(.+)$")
  if find and replace then
    vim.cmd(":%s/" .. vim.fn.escape(find, "/") .. "/" .. vim.fn.escape(replace, "/") .. "/g")
  else
    print("Usage: :Rp <string1> <string2>")
  end
end, { nargs = 1, complete = 'custom,v:lua.custom_complete' })

-- Custom highlight groups for Harpoon and TabLineFill
vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

