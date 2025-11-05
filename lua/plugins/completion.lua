return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup.filetype({ "sql" }, {
				sources = {
					{ name = "vim-dadbod-completion" },
					{ name =  "buffer" },
				},
			})
			luasnip.add_snippets("go", {
				luasnip.snippet("fn", {
					luasnip.text_node("func "),
					luasnip.insert_node(1, "name"),
					luasnip.text_node("("),
					luasnip.insert_node(2, "params"),
					luasnip.text_node(") "),
					luasnip.insert_node(3, "returnType"),
					luasnip.text_node({ " {", "\t" }),
					luasnip.insert_node(0),
					luasnip.text_node({ "", "}" }),
				}),
				luasnip.snippet("ien", {
					luasnip.text_node("if "),
					luasnip.insert_node(1, "err"),
					luasnip.text_node(" != nil {"),
					luasnip.text_node({ "", "\t" }),
					luasnip.insert_node(0),
					luasnip.text_node({ "", "}" }),
				}),
				luasnip.snippet("for", {
					luasnip.text_node("for "),
					luasnip.insert_node(1, "i := 0; i < n; i++"),
					luasnip.text_node(" {"),
					luasnip.text_node({ "", "\t" }),
					luasnip.insert_node(0),
					luasnip.text_node({ "", "}" }),
				}),
				luasnip.snippet("stt", {
					luasnip.text_node("type "),
					luasnip.insert_node(1, "Name"),
					luasnip.text_node(" struct {"),
					luasnip.text_node({ "", "\t" }),
					luasnip.insert_node(0),
					luasnip.text_node({ "", "}" }),
				}),
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
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
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	-- {
	-- 	"github/copilot.vim",
	-- 	config = function()
	-- 		vim.keymap.set("i", "<leader>cp", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
	-- 		vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", {})
	-- 		vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", {})
	-- 	end,
	-- },
}
