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
vim.o.tildeop = true 
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


function toggle_ch_file()
    local file = vim.fn.expand("%:t")  -- current filename
    local name = vim.fn.expand("%:r")  -- filename without extension
    local ext = vim.fn.expand("%:e")   -- current extension

    local target = nil
    if ext == "c" then
        target = name .. ".h"
    elseif ext == "h" then
        target = name .. ".c"
    else
        print("Not a .c or .h file")
        return
    end

    -- Open the target file (create if not exists)
    vim.cmd("edit " .. target)
end


-- Map <leader>d to toggle .c/.h
vim.api.nvim_set_keymap("n","<leader>d",":lua toggle_ch_file()<CR>",{ noremap=true, silent=true, desc="Toggle .c/.h file" })

-- Custom highlight groups for Harpoon and TabLineFill
vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

