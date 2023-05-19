require("impatient")
--- Setup LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("mason").setup()
require("mason-lspconfig").setup()

require 'lspconfig'.pyright.setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { buffer = 0 })
	end
}
require 'lspconfig'.lua_ls.setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { buffer = 0 })
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
		vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { buffer = 0 })
	end
}
require 'lspconfig'.vimls.setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { buffer = 0 })
	end
}
require 'lspconfig'.jsonls.setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { buffer = 0 })
	end
}
require 'lspconfig'.yamlls.setup {
	settings = {
		yaml = {
			schemas = {
				-- kubernetes = { "*.yaml" },
				-- kubernetes = {"/Kubernetes/**/*.yaml"},
				-- ["file:Users/austin/vimrc/nvim/extras/schemas/_definitions.json"] = { "*.yaml" },
				["file:Users/austin/vimrc/nvim/extras/schemas/all.json"] = { "*.yaml" },
			}
		}
	},
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { buffer = 0 })
	end
}
local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

if not configs.helm_ls then
	configs.helm_ls = {
		default_config = {
			cmd = { "helm_ls", "serve" },
			filetypes = { 'helm' },
			root_dir = function(fname)
				return util.root_pattern('Chart.yaml')(fname)
			end,
		},
	}
end

lspconfig.helm_ls.setup {
	filetypes = { "helm" },
	cmd = { "helm_ls", "serve" },
}

local on_attach = function(client, bufnr)
	-- other stuff --
	require("tailwindcss-colors").buf_attach(bufnr)
end
require 'lspconfig'.tailwindcss.setup({
	-- on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug",
		"typescriptreact", "vue" },
	on_attach = on_attach,
})
require 'lspconfig'.svelte.setup {
	filetypes = { "svelte", "html" },
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { buffer = 0 })
	end
}
require 'lspconfig'.rome.setup {
	filetypes = { "svelte", "html", "ts", "js" },
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { buffer = 0 })
	end
}
require 'lspconfig'.emmet_ls.setup({
	-- on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug",
		"typescriptreact", "vue" },
	init_options = {
		html = {
			options = {
				-- for possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#l79-l267
				["bem.enabled"] = true,
			},
		},
	}
})
require('lspconfig').ansiblels.setup {
	capabilities = capabilities,
	filetypes = { "yaml", "ansible" },
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { buffer = 0 })
	end
}
-- Setup nvim-cmp.
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require 'cmp'
local lspkind = require('lspkind')
local luasnip = require('luasnip')


-- local has_words_before = function()
-- 	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
-- end
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	preselect = cmp.PreselectMode.None,
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
			mode = 'symbol_text', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			symbol_map = { Copilot = "" },
		})
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
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
		-- ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- ['<CR>'] = cmp.mapping({
		-- 	i = function(fallback)
		-- 		if cmp.visible() and cmp.get_active_entry() then
		-- 			cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- 	s = cmp.mapping.confirm({ select = true }),
		-- 	c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		-- }),
		["<CR>"] = cmp.mapping.confirm({
			-- this is the important line
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() and cmp.get_active_entry() then
				cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				})()
			elseif luasnip.choice_active() and luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif luasnip.choice_active() then
				luasnip.unlink_current()
			else
				fallback()
			end
		end),
		-- ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		-- ["<Tab>"] = vim.schedule_wrap(function(fallback)
		-- 	if cmp.visible() and has_words_before() then
		-- 		cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		-- 	else
		-- 		fallback()
		-- 	end
		-- end),
		-- ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- they way you will only jump inside the snippet region
			elseif luasnip.choice_active() then
				luasnip.change_choice(1)
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
			{ name = 'copilot' }, -- For copilot
			{ name = 'nvim_lsp' },
			{ name = 'nvim_lsp_signature_help' },
			-- { name = 'vsnip' }, -- For vsnip users.
			{ name = 'path' },
			{ name = 'luasnip' }, -- For luasnip users.
			{ name = 'luasnip_choice' },
			-- { name = 'ultisnips' }, -- For ultisnips users.
			-- { name = 'snippy' }, -- For snippy users.
		},


		{
			{ name = 'buffer' },
			{ name = 'nvim_lsp_signature_help' },
		})
})


--- Setup Telescope
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('ui-select')
require('telescope').load_extension('dap')
require('telescope').load_extension('harpoon')
-- require('telescope').load_extension('macros')
-- local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")
telescope.setup {
	defaults = {
		mappings = {
			i = { ["<c-l>"] = trouble.open_with_trouble },
			n = { ["<c-l>"] = trouble.open_with_trouble },
		},
	},
}


--- Setup Treesitter
require 'nvim-treesitter.configs'.setup {
	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	highlight = {
		enable = true,
	},
	-- context_commenting= {
	-- 	enable = true,
	-- },
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
-- require('twilight').setup {}
--- Setup Zen
-- require('true-zen').setup {
-- 	modes = {
-- 		ataraxis = {
-- 			minimum_writing_area = {
-- 				width = 140
-- 			}
-- 		}
-- 	},
-- 	integrations = {
-- 		twilight = true
-- 	}
-- }
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
		require('null-ls').builtins.diagnostics.ruff,
		require('null-ls').builtins.formatting.black,
		require('null-ls').builtins.formatting.isort,

	},
})
--- Setup lsp_lines
require("lsp_lines").setup()
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = { only_current_line = true },
	update_in_insert = true,
})


--- Setup Silicon.lua
-- require("silicon").setup({})
require("silicon").setup({
	font = 'MesloLGSDZ Nerd Font Mono=16',
	theme = 'catppuccin_dark',
})

--- Setup copilot.lua
--- use right node for copilot
-- vim.g.copilot_node_command = "/opt/homebrew/opt/node@16/bin/node"
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""
-- require("copilot").setup({
-- 	suggestion = { enabled = false },
-- 	panel = { enabled = false},
-- 	filetypes = {
-- 		['*'] = true,
-- 	},
-- })
-- require("copilot_cmp").setup({
-- 	formatters = {
-- 		insert_text = require("copilot_cmp.format").remove_existing
-- 	},
-- })


--- Setup project.nvim
require('project_nvim').setup {}
--- Setup todo-comments.nvim
require("todo-comments").setup {}
--- Setup Navic
local navic = require("nvim-navic")
navic.setup({
	lsp = {
		auto_attach = true,
	}
})
require("lualine").setup({
	winbar = {
		lualine_a = {
			{
				function()
					return navic.get_location()
				end,
				cond = function()
					return navic.is_available()
				end
			},
		}
	}
})
--- Setup Navbuddy
local navbuddy = require("nvim-navbuddy")
navbuddy.setup({
	lsp = {
		auto_attach = true,
	}
})

require("lspconfig").clangd.setup {
	on_attach = function(client, bufnr)
		navbuddy.attach(client, bufnr)
	end
}
--- Setup gitsigns
require('gitsigns').setup({
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text_pos = 'right_align',
		delay = 1,
	},
	current_line_blame_formatter = '<author>'
})
--- Setup Tailwind Sorter
-- require('tailwind-sorter').setup()
-- Setup Wilder
local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })
wilder.set_option('renderer', wilder.popupmenu_renderer({
	pumblend = 20,
}))
wilder.set_option('renderer', wilder.popupmenu_renderer({
	highlighter = wilder.basic_highlighter(),
	left = { ' ', wilder.popupmenu_devicons() },
	right = { ' ', wilder.popupmenu_scrollbar() },
}))
wilder.set_option('renderer', wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme({
		highlights = {
			border = 'Normal', -- highlight to use for the border
		},
		-- 'single', 'double', 'rounded' or 'solid'
		-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
		border = 'rounded',
	})
))
-- Setup NeoComposer
-- require("lualine").setup({
-- 	winbar = {
-- 		lualine_z = {
-- 			{ require('NeoComposer.ui').status_recording() },
-- 		},
-- 	}
-- })
--
-- Setup luasnip
-- load snippets from path/of/your/nvim/config/my-cool-snippets


require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.vsnip/" } })
local current_nsid = vim.api.nvim_create_namespace("LuaSnipChoiceListSelections")
local current_win = nil

local function window_for_choiceNode(choiceNode)
	local buf = vim.api.nvim_create_buf(false, true)
	local buf_text = {}
	local row_selection = 0
	local row_offset = 0
	local text
	for _, node in ipairs(choiceNode.choices) do
		text = node:get_docstring()
		-- find one that is currently showing
		if node == choiceNode.active_choice then
			-- current line is starter from buffer list which is length usually
			row_selection = #buf_text
			-- finding how many lines total within a choice selection
			row_offset = #text
		end
		vim.list_extend(buf_text, text)
	end

	vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, buf_text)
	local w, h = vim.lsp.util._make_floating_popup_size(buf_text)

	-- adding highlight so we can see which one is been selected.
	local extmark = vim.api.nvim_buf_set_extmark(buf, current_nsid, row_selection, 0,
		{ hl_group = 'incsearch', end_line = row_selection + row_offset })

	-- shows window at a beginning of choiceNode.
	local win = vim.api.nvim_open_win(buf, false, {
		relative = "win", width = w, height = h, bufpos = choiceNode.mark:pos_begin_end(), style = "minimal",
		border = 'rounded' })

	-- return with 3 main important so we can use them again
	return { win_id = win, extmark = extmark, buf = buf }
end

function choice_popup(choiceNode)
	-- build stack for nested choiceNodes.
	if current_win then
		vim.api.nvim_win_close(current_win.win_id, true)
		vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
	end
	local create_win = window_for_choiceNode(choiceNode)
	current_win = {
		win_id = create_win.win_id,
		prev = current_win,
		node = choiceNode,
		extmark = create_win.extmark,
		buf = create_win.buf
	}
end

function update_choice_popup(choiceNode)
	vim.api.nvim_win_close(current_win.win_id, true)
	vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
	local create_win = window_for_choiceNode(choiceNode)
	current_win.win_id = create_win.win_id
	current_win.extmark = create_win.extmark
	current_win.buf = create_win.buf
end

function choice_popup_close()
	vim.api.nvim_win_close(current_win.win_id, true)
	vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
	-- now we are checking if we still have previous choice we were in after exit nested choice
	current_win = current_win.prev
	if current_win then
		-- reopen window further down in the stack.
		local create_win = window_for_choiceNode(current_win.node)
		current_win.win_id = create_win.win_id
		current_win.extmark = create_win.extmark
		current_win.buf = create_win.buf
	end
end

vim.cmd([[
augroup choice_popup
au!
au User LuasnipChoiceNodeEnter lua choice_popup(require("luasnip").session.event_node)
au User LuasnipChoiceNodeLeave lua choice_popup_close()
au User LuasnipChangeChoice lua update_choice_popup(require("luasnip").session.event_node)
augroup END
]])
--- setup whichkey
require("which-key").setup {}
--- setup octo.nvim
require "octo".setup({
	ssh_aliases = { ["github.com-awm"] = "github.com" }
})
--- setup alpha.nvim
require('alpha').setup(require('custom-alpha').config)
--- tune matchup
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_deferred_show_delay = 300
--- setup chatgpt
require('chatgpt').setup({})
