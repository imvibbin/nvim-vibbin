return {
	-- NOTE: # NEOVIM PLUGINS #
	-- NOTE: ---- Themes
	{
		"oxfist/night-owl.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			--	require("night-owl").setup() -- You can pass in your personal settings here.
			--	vim.cmd.colorscheme("night-owl")
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			-- load the colorscheme here
			--vim.o.background = "dark" -- or "light" for light mode
			--vim.cmd([[colorscheme gruvbox]])
		end,
		opts = ...,
	},

	-- NOTE: ---- Quality of life
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = function()
			return require("plugins.configs.noice")
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = function()
			return require("plugins.configs.oil")
		end,
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("plugins.configs.telescope")
		end,
		--function(_,opts)
		--	    require("telescope").setup(opts)
		--  end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"vim",
					"lua",
					"vimdoc",
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"c",
					"rust",
					"svelte",
					"cpp",
					"python",
					"yaml",
					"zig",
					"java",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require("plugins.configs.lualine")
		end,
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
	{
		"phaazon/hop.nvim",
		opts = function()
			return require("plugins.configs.hop")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
		config = function()
			require("plugins.configs.harpoon")
		end,
	},

	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				FIX = {
					icon = " ",
					color = "#DC2626",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = { icon = " ", color = "#FFFFFF" },
				HACK = { icon = " ", color = "#ffa154" },
				WARN = { icon = " ", color = "#ffa154", alt = { "WARNING", "XXX" } },
				PERF = { icon = "󰾩 ", color = "#e09eff", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				TEST = { icon = "󰙨 ", color = "#7152bf", alt = { "TESTING", "PASSED", "FAILED" } },
				NOTE = { icon = " ", color = "#10B981", alt = { "INFO" } },
				SECTION = { icon = " ", color = "#87ffcb" },
			},
			merge_keywords = true,
		},
	},

	{
		"Wansmer/treesj",
		keys = { { "<leader>mm", "<CMD>TSJToggle<CR>", desc = "Toggle Tresitter Join" } },
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		opts = { use_default_keymaps = false },
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- NOTE: LSP
	{ "nvim-java/nvim-java" },
	{ "williamboman/mason-lspconfig.nvim" },

	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstallAll" },
		opts = function()
			return require("plugins.configs.mason")
		end,
		config = function(_, opts)
			require("mason").setup(opts)
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if opts.ensure_installed and #opts.ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
				end
			end, {})
			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			return require("plugins.configs.nvimtree")
		end,
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
	},
	{
		-- Thank you to Josean for his video https://youtu.be/NL8D8EkphUw?si=3ZAt7ZJ0S1HuDJ_M
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				snippet = { -- configure how nvim-mp interacts with snippet engine
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-K>"] = cmp.mapping.select_prev_item(), --previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		lazy = false, -- This plugin is already lazy
		ft = "rust",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			local bufnr = vim.api.nvim_get_current_buf()
			vim.keymap.set("n", "<leader>a", function()
				vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
				vim.cmd.RustLsp("debug")
				vim.cmd.RustLsp("debuggables")
				-- or, to run the previous debuggable:
				vim.cmd.RustLsp({ "debuggables", bang = true })
				-- or, to override the executable's args:
				vim.cmd.RustLsp({ "debuggables", "arg1", "arg2" })
				-- or vim.lsp.buf.codeAction() if you don't want grouping.
			end, { silent = true, buffer = bufnr })
			vim.api.nvim_create_user_command("RustDebuggables", function()
				vim.cmd("RustLsp debuggables")
			end, {})
		end,
	},

	-- NOTE: Formatters
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return require("plugins.configs.formating")
		end,
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},

	-- NOTE: DAP
	{ "rcarriga/cmp-dap" },
	{
		"mfussenegger/nvim-dap",
		--lldb is required for debuggin to work:
		--vim.keymap.set("n", "<leader>ds", vim.cmd.DapSidebar)
		config = function()
			vim.api.nvim_create_user_command("DapSidebar", function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end, {})
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		opts = function()
			return require("plugins.configs.dap_js")
		end,
		config = function(_, opts)
			require("dap-vscode-js").setup(opts)
		end,
	},
}
