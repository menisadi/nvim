return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", config = true },
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})
						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			if vim.g.have_nerd_font then
				vim.diagnostic.config({
					signs = {
						[vim.diagnostic.severity.ERROR] = {
							text = "",
							texthl = "DiagnosticSignError",
							numhl = "DiagnosticSignError",
						},
						[vim.diagnostic.severity.WARN] = {
							text = "",
							texthl = "DiagnosticSignWarn",
							numhl = "DiagnosticSignWarn",
						},
						[vim.diagnostic.severity.HINT] = {
							text = "",
							texthl = "DiagnosticSignHint",
							numhl = "DiagnosticSignHint",
						},
						[vim.diagnostic.severity.INFO] = {
							text = "",
							texthl = "DiagnosticSignInfo",
							numhl = "DiagnosticSignInfo",
						},
					},
				})
			end

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local servers = {
				basedpyright = {},
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							}
						}
					}
				},
			}

			require("mason").setup()

			local ensure_installed = { "lua-language-server", "basedpyright", "stylua" }
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			for name, cfg in pairs(servers) do
				cfg.capabilities = vim.tbl_deep_extend("force", {}, capabilities, cfg.capabilities or {})
				vim.lsp.config(name, cfg)
			end
			vim.lsp.enable(vim.tbl_keys(servers))

			if vim.fn.executable("gleam") == 1 then
				vim.lsp.config("gleam", {
					cmd = { "gleam", "lsp" },
					filetypes = { "gleam" },
					root_markers = { "gleam.toml", ".git" },
					capabilities = capabilities,
				})
				vim.lsp.enable("gleam")
			else
				vim.notify("Gleam executable not found – skipping Gleam LSP setup", vim.log.levels.WARN)
			end
		end,
	},
}
