local lspconfig = require("lspconfig")

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, _)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {})
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {})
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, {})
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, {})
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
	vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set(
		"n",
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "Telescope search for lsp references" }
	)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, {})
end

local servers = {
	"html",
	"cssls",
	"clangd",
	"ts_ls",
	"tailwindcss",
	"emmet_ls",
	"lua_ls",
	"pyright",
	"svelte",
	"zls",
	"angularls",
	"jdtls",
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end
