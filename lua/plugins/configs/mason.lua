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
		"jdtls",

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
		"java-debug-adapter",
		"java-test",
	},

	max_concurrent_installers = 10,
}
