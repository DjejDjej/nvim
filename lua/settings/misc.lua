-- Define a command :Rp to replace 'string1' with 'string2'
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

