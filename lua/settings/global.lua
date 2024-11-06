vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.fillchars = 'eob: '

vim.opt.fillchars.eob = ' '

vim.opt.number = true          -- Shows absolute line numbers
vim.opt.relativenumber = true  -- Shows relative line numbers
vim.opt.cmdheight = 0


vim.api.nvim_set_keymap('n', 'p', ':lua ImprovedPaste()<CR>', { noremap = true, silent = true })

function ImprovedPaste()
    -- Move cursor left if not at the beginning of the line
    if vim.fn.col('.') ~= 1 then
        vim.api.nvim_command('normal! h')
    end

    -- Get the unnamed register content
    local paste_content = vim.fn.getreg('"')
    
    -- Remove trailing newline if content is a single line
    if string.match(paste_content, '\n$') and #vim.split(paste_content, '\n') == 2 then
        paste_content = string.gsub(paste_content, '\n$', '')
    end

    -- Insert paste content
    vim.api.nvim_put({paste_content}, 'c', true, true)
end

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
