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

---- BUILD func


-- Define a list of filetype-to-command mappings
local build_commands = {
    { "c", "gcc %s -o %s" },  -- Command for C files
    { "go", "go build" }      -- Command for Go files
}

-- Function to read and execute a custom command from .buildcmd if it exists
local function execute_custom_build()
    local buildcmd_file = ".buildcmd"
    if vim.fn.filereadable(buildcmd_file) == 1 then
        vim.fn.system("bash " .. buildcmd_file .. " >/dev/null 2>&1")  -- Run custom command silently
        return true
    end
    return false
end

-- Global function to find and execute a build command based on file type
function _G.build_file()
    -- First, check if there's a custom .buildcmd file and execute it if it exists
    if execute_custom_build() then
        return
    end

    -- Get the current filetype, full filename, and output name without extension
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand("%")
    local output = vim.fn.expand("%:r")

    -- Search for a matching build command in the list
    for _, entry in ipairs(build_commands) do
        if entry[1] == filetype then
            -- Format the command with filename and output
            local command = string.format(entry[2], filename, output)
            vim.fn.system(command .. " >/dev/null 2>&1")  -- Run the command silently
            return
        end
    end

    -- If no matching command is found, show an error
    print("No build command configured for this file type!")
end

-- Map Leader + B to the build_file function without displaying the command
