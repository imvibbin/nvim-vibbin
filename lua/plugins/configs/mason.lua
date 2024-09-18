return {
	ensure_installed = {
		-- LSP
		"angular-language-server",
		"clangd",
		"html-lsp",
		"emmet-ls",
		"json-lsp",
		"lua-language-server",
		"pyright",
		"rust-analyzer",
		"svelte-language-server",
		"typescript-language-server",
		"zls",
		"sqlls",
		"tailwindcss-language-server",

		-- Formatters
		"black",
		"isort",
		"prettier",
		"rustfmt",
		"stylua",
		"xmlformatter",
		"sql-formatter",

		-- DAP
		"codelldb",
		"debugpy",
	},

	max_concurrent_installers = 10,
}
