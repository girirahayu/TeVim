vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

local sysname = vim.loop.os_uname().sysname
local comment_key = "<C-_>" -- Default for Linux

if sysname == "Darwin" then
  comment_key = "<C-/>" -- For macOS
end


local plugins = {
	-- Utility libraries
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },

	-- Syntax and formatting
	{
		'sheerun/vim-polyglot',
		config = function()
			vim.g.polyglot_disabled = {}
		end,
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		cmd = { 'RenderMarkdown' },
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons', -- or your preferred icon provider
		},
		opts = {},
		config = function()
			require('render-markdown').setup({
				completions = { blink = { enabled = true } },
				completions = { lsp = { enabled = true } }
			})
			-- Keymaps for all features
			local keymap = vim.keymap.set
			-- Enable/Disable/Toggle globally
			keymap("n", "<leader>rme", "<cmd>RenderMarkdown enable<cr>",   { desc = "Enable RenderMarkdown" })
			keymap("n", "<leader>rmd", "<cmd>RenderMarkdown disable<cr>",  { desc = "Disable RenderMarkdown" })
			keymap("n", "<leader>rmt", "<cmd>RenderMarkdown toggle<cr>",   { desc = "Toggle RenderMarkdown" })
			-- Buffer-local enable/disable/toggle
			keymap("n", "<leader>rmb",  "<cmd>RenderMarkdown buf_enable<cr>",   { desc = "Enable RenderMarkdown (Buffer)" })
			keymap("n", "<leader>rmbd", "<cmd>RenderMarkdown buf_disable<cr>",  { desc = "Disable RenderMarkdown (Buffer)" })
			keymap("n", "<leader>rmbt", "<cmd>RenderMarkdown buf_toggle<cr>",   { desc = "Toggle RenderMarkdown (Buffer)" })
			-- Utility commands
			keymap("n", "<leader>rml", "<cmd>RenderMarkdown log<cr>",      { desc = "RenderMarkdown Log" })
			keymap("n", "<leader>rmx", "<cmd>RenderMarkdown expand<cr>",   { desc = "Expand anti-conceal margin" })
			keymap("n", "<leader>rmc", "<cmd>RenderMarkdown contract<cr>", { desc = "Contract anti-conceal margin" })
			keymap("n", "<leader>rmD", "<cmd>RenderMarkdown debug<cr>",    { desc = "RenderMarkdown Debug" })
			keymap("n", "<leader>rmC", "<cmd>RenderMarkdown config<cr>",   { desc = "RenderMarkdown Config Diff" })
		end,
		event = "VeryLazy",
	},
	{
		"sbdchd/neoformat",
		config = function()
			vim.cmd([[
				augroup fmt
				  autocmd!
				  autocmd BufWritePre * undojoin | Neoformat
				augroup END
			]])
			vim.g.neoformat_enabled_python = {'black'}
			vim.g.neoformat_enabled_javascript = {'prettier'}
			vim.g.neoformat_enabled_lua = {'stylua'}
			vim.g.neoformat_verbose = 1
			vim.g.neoformat_run_all_formatters = 1
		end,
	},

	-- Icons
	{
		"nvim-tree/nvim-web-devicons",
		event = "BufRead",
		opts = function()
			require("nvim-web-devicons").setup {
				override = {
					default_icon = {
						icon = "󰈚",
						color = "#6d8086",
						name = "Default",
					},
				},
			}
		end,
	},

	-- Copilot & CopilotChat
	{
		"github/copilot.vim",
		event = "InsertEnter",
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_filetypes = {
				["*"] = true,
				["markdown"] = true,
				["gitcommit"] = true,
			}
			vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
			vim.api.nvim_set_keymap("i", "<C-K>", "<Plug>(copilot-previous)", { silent = true })
			vim.api.nvim_set_keymap("i", "<C-L>", "<Plug>(copilot-next)", { silent = true })
			vim.api.nvim_set_keymap("i", "<C-\\>", "<Plug>(copilot-dismiss)", { silent = true })
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		opts = {
			debug = false,
			show_help = true,
			auto_follow_cursor = false,
			system_prompt = "You are a helpful AI assistant embedded in Neovim.",
			window = {
				layout = "vertical",
				width = 0.4,
				relative = "editor",
				position = "right",
				border = "rounded",
				row = 1,
				height = 0.95,
			},
			selection = function(source)
				return require("CopilotChat.select").unnamed(source)
			end,
			prompts = {
				Explain = {
					prompt = "Explain how this code works in simple terms.",
					selection = function(source) return require("CopilotChat.select").buffer(source) end,
				},
				Review = {
					prompt = "Review this code and suggest improvements.",
					selection = function(source) return require("CopilotChat.select").buffer(source) end,
				},
				Tests = {
					prompt = "Generate comprehensive unit tests for this code.",
					selection = function(source) return require("CopilotChat.select").buffer(source) end,
				},
				Refactor = {
					prompt = "Refactor this code to improve readability and performance.",
					selection = function(source) return require("CopilotChat.select").buffer(source) end,
				},
				Fix = {
					prompt = "Fix this code to make it work as intended.",
					selection = function(source) return require("CopilotChat.select").buffer(source) end,
				},
			}
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			local select = require("CopilotChat.select")
			local actions = require("CopilotChat.actions")

			chat.setup(opts)

			vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
				chat.ask(args.args, { selection = select.visual })
			end, { nargs = "*", range = true })

			vim.api.nvim_create_user_command("CopilotChatInline", function(args)
				chat.ask(args.args, {
					selection = select.visual,
					window = {
						layout = "float",
						relative = "cursor",
						width = 1,
						height = 0.4,
						row = 1,
					},
				})
			end, { nargs = "*", range = true })

			vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
				chat.ask(args.args, { selection = select.buffer })
			end, { nargs = "*", range = true })

			local keymap = vim.keymap.set
			keymap("n", "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })
			keymap("n", "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "Explain code" })
			keymap("n", "<leader>ct", "<cmd>CopilotChatTests<cr>", { desc = "Generate tests" })
			keymap("n", "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "Review code" })
			keymap("n", "<leader>cR", "<cmd>CopilotChatRefactor<cr>", { desc = "Refactor code" })
			keymap("n", "<leader>cf", "<cmd>CopilotChatFix<cr>", { desc = "Fix code" })
			keymap("n", "<leader>cg", "<cmd>CopilotChatReset<cr>", { desc = "Reset chat" })
			keymap("n", "<leader>cm", "<cmd>CopilotChatModels<cr>", { desc = "Chat Model" })
			keymap("n", "<leader>cq", function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					vim.cmd("CopilotChat " .. input)
				end
			end, { desc = "Quick chat" })
			keymap("x", "<leader>cv", ":CopilotChatVisual<cr>", { desc = "Visual chat" })
			keymap("x", "<leader>cx", ":CopilotChatInline<cr>", { desc = "Inline chat" })
			keymap("n", "<leader>cp", function()
				require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
			end, { desc = "Prompt actions" })
			keymap("n", "<leader>cHs", ":CopilotChatSave<Space>", { desc = "Save Copilot Chat history" })
			keymap("n", "<leader>cHl", ":CopilotChatLoad<Space>", { desc = "Load Copilot Chat history" })
		end,
		event = "VeryLazy",
	},
-- 	{
-- 	  "jackMort/ChatGPT.nvim",
-- 	  event = "VeryLazy",
-- 	  config = function()
-- 		require("chatgpt").setup({
-- 		  -- Assumes you have OPENAI_API_KEY set in your environment
-- 		  api_key_cmd = nil, -- use env var
-- yank_register = "+",
-- 		  edit_with_instructions = {
-- 			diff = true,
-- 			keymaps = {
-- 			  use_output = "<C-y>",
-- 			  use_output_replace = "<C-r>",
-- 			  toggle_diff = "<C-d>",
-- 			  toggle_settings = "<C-o>",
-- 			  cycle_windows = "<Tab>",
-- 			  select_session = "<Space>",
-- 			  toggle_help = "<F1>",
-- 			},
-- 		  },
-- 		  chat = {
-- 			welcome_message = WELCOME_MESSAGE,
-- 			loading_text = "Loading, please wait ...",
-- 			question_sign = "", -- 🙂
-- 			answer_sign = "ﮧ", -- 🤖
-- 			max_line_length = 120,
-- 			sessions_window = {
-- 			  border = {
-- 				style = "rounded",
-- 				text = {
-- 				  top = " Sessions ",
-- 				},
-- 			  },
-- 			  win_options = {
-- 				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
-- 			  },
-- 			},
-- 			-- POPUP LOCATION: right side
-- 			window = {
-- 			  layout = {
-- 				position = "right", -- <--- THIS SETS THE POPUP TO THE RIGHT
-- 				width = 0.4,        -- 40% of the screen width
-- 				height = 0.95,
-- 			  },
-- 			  border = {
-- 				style = "rounded",
-- 				text = {
-- 				  top = " ChatGPT ",
-- 				},
-- 			  },
-- 			  win_options = {
-- 				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
-- 			  },
-- 			},
-- 		  },
-- 		  popup_input = {
-- 			prompt = "  ",
-- 			border = {
-- 			  highlight = "FloatBorder",
-- 			  style = "rounded",
-- 			  text = {
-- 				top_align = "center",
-- 				top = " Prompt ",
-- 			  },
-- 			},
-- 			win_options = {
-- 			  winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
-- 			},
-- 			submit = "<C-Enter>",
-- 			submit_n = "<Enter>",
-- 		  },
-- 		  openai_params = {
-- 			model = "gpt-4-1106-preview", -- or your preferred model
-- 			frequency_penalty = 0,
-- 			presence_penalty = 0,
-- 			max_tokens = 4095,
-- 			temperature = 0.2,
-- 			top_p = 0.1,
-- 			n = 1,
-- 		  },
-- 		  openai_edit_params = {
-- 			model = "gpt-3.5-turbo",
-- 			temperature = 0,
-- 			top_p = 1,
-- 			n = 1,
-- 		  },
-- 		  actions_paths = {}, -- can add custom actions here
-- 		  show_quickfixes_cmd = "Trouble quickfix",
-- 		  predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
-- 		})
--
-- 		-- Keymaps for all features
-- 		vim.keymap.set("n", "<leader>cGt", ":ChatGPT<CR>", { desc = "Open ChatGPT" })
-- 		vim.keymap.set("n", "<leader>cGe", ":ChatGPTEditWithInstructions<CR>", { desc = "Edit with ChatGPT" })
-- 		vim.keymap.set({ "n", "v" }, "<leader>cGg", ":ChatGPTRun grammar_correction<CR>", { desc = "Grammar Correction" })
-- 		vim.keymap.set({ "n", "v" }, "<leader>cGt", ":ChatGPTRun translate<CR>", { desc = "Translate" })
-- 		vim.keymap.set({ "n", "v" }, "<leader>cGk", ":ChatGPTRun keywords<CR>", { desc = "Keywords" })
-- 		vim.keymap.set({ "n", "v" }, "<leader>cGd", ":ChatGPTRun docstring<CR>", { desc = "Docstring" })
-- 		vim.keymap.set({ "n", "v" }, "<leader>cGa", ":ChatGPTRun add_tests<CR>", { desc = "Add Tests" })
-- 		vim.keymap.set({ "n", "v" }, "<leader>cGo", ":ChatGPTRun optimize_code<CR>", { desc = "Optimize Code" })
-- 		vim.keymap.set({ "n", "v" }, "<leader>cGs", ":ChatGPTRun summarize<CR>", { desc = "Summarize" })
-- 		vim.keymap.set({ "n", "v" }, "<leader>cGf", ":ChatGPTRun fix_bugs<CR>", { desc = "Fix Bugs" })
-- 		vim.keymap.set({ "n", "v" }, "<leader>cGx", ":ChatGPTRun explain_code<CR>", { desc = "Explain Code" })
-- 		vim.keymap.set({ "n", "v" }, "<leader>cGr", ":ChatGPTRun roxygen_edit<CR>", { desc = "Roxygen Edit" })
-- 		vim.keymap.set({ "n", "v" }, "<leader>cGl", ":ChatGPTRun code_readability_analysis<CR>", { desc = "Code Readability Analysis" })
-- 	  end,
-- 	  dependencies = {
-- 		"MunifTanjim/nui.nvim",
-- 		"nvim-lua/plenary.nvim",
-- 		"folke/trouble.nvim", -- optional
-- 		"nvim-telescope/telescope.nvim"
-- 	  }
-- 	},
		-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = { { mode = { "n", "v" }, "<C-e>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" } },
		commit = "8afbb06081ce1e4beb5b18945d14a608b10babeb",
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if vim.fn.argc(-1) == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = function()
			return require("tevim.plugins.configs.neotree")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUninstall", "TSUpdate" },
		build = ":TSUpdate",
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
			{
				"windwp/nvim-ts-autotag",
				ft = { "html", "javascript", "jsx", "typescript", "tsx", "svelte", "vue", "xml", "markdown" },
				opts = { enable_close_on_slash = false },
			},
		},
		opts = function()
			return require("tevim.plugins.configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"echasnovski/mini.indentscope",
				opts = { symbol = "│" },
			},
		},
		opts = function()
			return require("tevim.plugins.configs.blankline")
		end,
	},

	-- Commenting
	{
		"numToStr/Comment.nvim",
		keys = {
			{ mode = "n", comment_key, "<Plug>(comment_toggle_linewise_current)",      desc = "Toggle Comment" },
			{ mode = "i", comment_key, "<esc><Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment(Insert)" },
			{ mode = "v", comment_key, "<Plug>(comment_toggle_linewise_visual)",       desc = "Toggle Comment(Visual)" },
		},
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
		end,
	},
	-- Dressing (UI select/input)
	{
		"stevearc/dressing.nvim",
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- TODO comments
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		cmd = "TodoTelescope",
		opts = { signs = false },
	},

	-- Telescope and extensions
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
		},
		opts = function()
			return require("tevim.plugins.configs.telescope")
		end,
	},

	-- Git integration
	{
		"lewis6991/gitsigns.nvim",
		ft = { "gitcommit", "diff" },
		init = function()
			vim.api.nvim_create_autocmd({ "BufRead" }, {
				group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
				callback = function()
					vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" }, {
						on_exit = function(_, return_code)
							if return_code == 0 then
								vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
								vim.schedule(function()
									require("lazy").load({ plugins = { "gitsigns.nvim" } })
								end)
							end
						end,
					})
				end,
				desc = "Load gitsigns only if git repository",
			})
		end,
		opts = function()
			return require("tevim.plugins.configs.gitsign")
		end,
	},
	{ "tpope/vim-fugitive", cmd = { "Git", "G" } },
	{ "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewClose" } },

	-- Colorizer
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
		opts = function()
			vim.defer_fn(function()
				require("colorizer").attach_to_buffer(0)
			end, 0)
			return require("colorizer").setup()
		end,
	},

	-- Which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = function()
			return require("tevim.plugins.configs.whichkey")
		end,
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		keys = {
			{
				mode = { "n", "t", "v" },
				[[<C-`>]],
				"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
				{ desc = "Toggle Terminal" },
			},
		},
		version = "*",
		opts = {
			shading_factor = 0.2,
			highlights = { NormalFloat = { link = "NormalFloat" } },
			float_opts = { border = "none" },
		},
	},

	-- Highlight word under cursor
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { filetypes_denylist = { "neo-tree", "Trouble", "DressingSelect", "TelescopePrompt" } },
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},

	-- Status column
	{
		"luukvbaal/statuscol.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				ft_ignore = { "neo-tree", "Outline" },
				segments = {
					{ sign = { namespace = { "diagnostic*" } } },
					{ sign = { namespace = { "gitsign" } },    click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc, "  " },       click = "v:lua.ScLa" },
					{ text = { builtin.foldfunc, "  " },       click = "v:lua.ScFa" },
				},
			})
		end,
	},

	-- Folding
	{
		"kevinhwang91/nvim-ufo",
		event = { "BufReadPost", "BufNewFile" },
		commit = "aa2e676af592b4e99c105d80d6eafd1afc215d99",
		dependencies = "kevinhwang91/promise-async",
		init = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,
		config = function()
			require("ufo").setup()
		end,
	},

	-- Completion, snippets, autopairs
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			{
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("tevim.plugins.configs.luasnips").luasnip(opts)
				end,
			},
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				opts = function()
					require("nvim-autopairs").setup({ fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } })
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
		},
		opts = function()
			return require("tevim.plugins.configs.cmp")
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
		dependencies = {
			{
				"nvimdev/lspsaga.nvim",
				opts = { symbol_in_winbar = { show_file = false } },
			},
			{
				"williamboman/mason.nvim",
				cmd = { "Mason", "MasonInstall", "MasonUpdate" },
				opts = function()
					return require("tevim.plugins.configs.mason")
				end,
			},
			{
				"ray-x/lsp_signature.nvim",
				opts = { hint_enable = false },
			},
			-- LSP enhancements
			{ "folke/trouble.nvim", opts = { use_diagnostic_signs = true } },
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("tevim.plugins.configs.lspconfig")
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return require("tevim.plugins.configs.lualine")
		end,
	},

	-- Buffer/tab line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = function()
			return require("tevim.plugins.configs.bufferline")
		end,
	},

	-- Project management
	{
	  "ahmedkhalf/project.nvim",
	  event = "VeryLazy",
	  config = function()
		require("project_nvim").setup({})
	  end,
	},

	-- Symbols outline
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		opts = {},
	},

	-- Leap for navigation
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
}

-- Load custom plugins if present
local check, _ = pcall(require, "custom")
if check then
	require("custom")
	local custom_plugins = require("custom.plugins")
	if #custom_plugins > 0 then
		for _, plugin in ipairs(custom_plugins) do
			table.insert(plugins, plugin)
		end
	end
else
	vim.cmd("TeVimCreateCustom")
end

require("lazy").setup(plugins, {
	defaults = { lazy = true },
	ui = {
		backdrop = 100,
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})
