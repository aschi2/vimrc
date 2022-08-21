--- Setup LSP
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require("mason").setup()
require("mason-lspconfig").setup()
require 'lspconfig'.jedi_language_server.setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = 0 })
		vim.keymap.set("n", "<leader>gf", "<cmd> Telescope diagnostics<cr>", { buffer = 0 })
		vim.keymap.set("n", "<leader>gc", vim.lsp.buf.rename, { buffer = 0 })
	end
}
require 'lspconfig'.sumneko_lua.setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = 0 })
		vim.keymap.set("n", "<leader>gf", "<cmd> Telescope diagnostics<cr>", { buffer = 0 })
		vim.keymap.set("n", "<leader>gc", vim.lsp.buf.rename, { buffer = 0 })
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}
require 'lspconfig'.gopls.setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = 0 })
		vim.keymap.set("n", "<leader>gf", "<cmd> Telescope diagnostics<cr>", { buffer = 0 })
		vim.keymap.set("n", "<leader>gc", vim.lsp.buf.rename, { buffer = 0 })
	end
}
require 'lspconfig'.vimls.setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = 0 })
		vim.keymap.set("n", "<leader>gf", "<cmd> Telescope diagnostics<cr>", { buffer = 0 })
		vim.keymap.set("n", "<leader>gc", vim.lsp.buf.rename, { buffer = 0 })
	end
}
require 'lspconfig'.yamlls.setup {
	settings = {
		yaml = {
			schemas = {
				-- kubernetes = {"/*.yaml"}
				-- kubernetes = {"/Kubernetes/**/*.yaml"},
				["file:Users/austin/vimrc/nvim/extras/schemas/all.json"] = { "/Kubernetes/**/*.yaml" }
			}
		}
	},
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = 0 })
		vim.keymap.set("n", "<leader>gf", "<cmd> Telescope diagnostics<cr>", { buffer = 0 })
		vim.keymap.set("n", "<leader>gc", vim.lsp.buf.rename, { buffer = 0 })
	end
}
require 'lspconfig'.svelte.setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = 0 })
		vim.keymap.set("n", "<leader>gf", "<cmd> Telescope diagnostics<cr>", { buffer = 0 })
		vim.keymap.set("n", "<leader>gc", vim.lsp.buf.rename, { buffer = 0 })
	end
}

-- Setup nvim-cmp.
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require 'cmp'
local lspkind = require('lspkind')
cmp.setup({
	completion = {
		get_trigger_characters = function(trigger_characters)
			local new_trigger_characters = {}
			for _, char in ipairs(trigger_characters) do
				if char ~= '>' then
					table.insert(new_trigger_characters, char)
				end
			end
			return new_trigger_characters
		end
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		})
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	},


	{
		{ name = 'buffer' },
		{ name = 'nvim_lsp_signature_help'},
	})
})

--- Setup Telescope
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('ui-select')
require('telescope').load_extension('dap')


--- Setup Treesitter
require 'nvim-treesitter.configs'.setup {
	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	highlight = {
		enable = true,

	},
}

--- Setup Lualine
require('lualine').setup({
	options = {
		globalstatus = true,
		theme = "catppuccin"
	}
})

--- Setup Dap
require('dap')
vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '👉', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '❓', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '🚫', texthl = '', linehl = '', numhl = '' })
require('dap-python').setup('/opt/homebrew/bin/python3')
require('dap-go').setup()
require('dapui').setup()
require("nvim-dap-virtual-text").setup()


--- Setup Autopairs
require('nvim-autopairs').setup {}
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

--- Setup Commentary.nvim
require('Comment').setup()

--- Setup Leap
require('leap').set_default_keymaps()
--- Setup Twilight
require('twilight').setup {}
--- Setup Zen
require('true-zen').setup {
	modes = {
		ataraxis = {
			minimum_writing_area = {
				width = 140
			}
		}

	},
	integrations = {
		twilight = true
	}
}
--- Setup Neoclip
require('neoclip').setup {
	enable_persistent_history = true
}
--- Setup catppuccin
require("catppuccin").setup({
	integrations = {
		dap = {
			enabled = true,
			enable_ui = true,
		},
		barbar = true,
		lightspeed = true,


	}
})
-- setup indent-blankline
require("indent_blankline").setup {
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
}
--- setup null-ls
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.black,
	},
})
--- Setup lsp_lines
require("lsp_lines").setup()
vim.diagnostic.config({
  virtual_text = false,
})



