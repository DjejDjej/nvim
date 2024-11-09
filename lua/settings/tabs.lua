vim.o.showtabline = 1  -- Always show tabline if there are two or more tabs open

-- Always show the tabline

-- Define a function to customize the tabline
function _G.custom_tabline()
    local s = ''
    for tabnr = 1, vim.fn.tabpagenr('$') do
        local winnr = vim.fn.tabpagewinnr(tabnr)
        local bufnr = vim.fn.tabpagebuflist(tabnr)[winnr]
        local bufname = vim.fn.bufname(bufnr)

        -- Only display tabs for files, ignoring Nvim Tree or empty tabs
            -- Extract just the file name
            local filename = vim.fn.fnamemodify(bufname, ':t')
            -- Highlight the current tab differently
            if tabnr == vim.fn.tabpagenr() then
                s = s .. '%#TabLineSel# ' .. filename .. ' '
            else
                s = s .. '%#TabLine# ' .. filename .. ' '
            end
    end
    s = s .. '%#TabLineFill#'
    return s
end

-- Set the tabline to use the custom function
vim.o.tabline = '%!v:lua.custom_tabline()'

for i = 1, 9 do
  vim.api.nvim_set_keymap(
    'n', 
    '<C-' .. i .. '>', 
    ':tabn ' .. i .. '<CR>', 
    { noremap = true, silent = true }
  )
end
