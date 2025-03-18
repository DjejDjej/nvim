-- Clipboard and Leader settings
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "

-- Basic editor options
vim.opt.title = true
vim.opt.autochdir = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0
vim.opt.mouse = ''
vim.o.showtabline = 1
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.o.wrap = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/.undodir"

-- Fill characters
vim.opt.fillchars = 'eob: '
vim.opt.fillchars.eob = ' '

-- Highlights
vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

-- Dynamic window title based on file
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local file_name = vim.fn.expand("%:t")
        if file_name == "" then
            file_name = "[No Name]"
        end
        vim.opt.titlestring = "nvim - " .. file_name
    end
})

-- Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300,
    })
  end,
})

-- Disable signcolumn for Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.signcolumn = "no"
  end,
})

-- User command for replacing strings
vim.api.nvim_create_user_command(
    'Rp',
    function(opts)
        local find = opts.args:match("^(%S+)")
        local replace = opts.args:match("%s+(.+)$")
        if find and replace then
            vim.cmd(":%s/" .. vim.fn.escape(find, "/") .. "/" .. vim.fn.escape(replace, "/") .. "/g")
        else
            print("Usage: :Rp <string1> <string2>")
        end
    end,
    { nargs = 1, complete = 'custom,v:lua.custom_complete' }
)
