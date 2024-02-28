local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
    return
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

local sources = {
    formatting.black,
    formatting.stylua,
    formatting.prettierd,
    code_actions.gitsigns,
    code_actions.shellcheck,
}

null_ls.setup({
    sources = sources,
})
