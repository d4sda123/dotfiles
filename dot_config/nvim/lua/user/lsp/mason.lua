local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end


mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
})
mason_lspconfig.setup()

local servers = { "bashls", "emmet_ls", "html", "pylsp", "pyright", "lua_ls",
    "tailwindcss", "tsserver", "jsonls", "cssls"}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    local function keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    keymap("n", "lj", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts) -- Prev diagnostic
    keymap("n", "lk", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts) -- Next diagnostic
    keymap("n", "lf", "<cmd>lua vim.diagnostic.open_float()<cr>", opts) -- Show diagnostics
    keymap("n", "ld", "<cmd>lua vim.lsp.buf.definition({reuse_win = true})<cr>", opts) -- Jump to definition
    keymap("n", "lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    keymap("n", "lh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts) -- Display info
    keymap("n", "lH", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts) -- Display signature info
    keymap("n", "lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts) -- Rename symbol
    keymap("n", "lF", "<cmd>lua vim.lsp.buf.format{ async = true}<cr>", opts) -- Format code
    keymap("n", "lR", "<cmd>lua vim.lsp.buf.references()<cr>", opts) -- Show references
    keymap("n", "lt", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts) -- Show references

end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})

local signs = { Error = " ", Warn = " ", Hint = "󰘥 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = false,
    signs = {
        active = signs,
    },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
    },
})

local opts = {}
for _, server in pairs(servers) do
    opts = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }
    server = vim.split(server, "@")[1]
    local require_conf, conf_opts = pcall(require, "user.lsp.settings." .. server)
    if require_conf then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end
    lspconfig[server].setup(opts)
end
