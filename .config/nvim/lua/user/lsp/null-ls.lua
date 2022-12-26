local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

local sources = {
    -- formatting.prettier,
    formatting.black,
    formatting.stylua,
    code_actions.gitsigns,
}

null_ls.setup({
    sources = sources,
})
