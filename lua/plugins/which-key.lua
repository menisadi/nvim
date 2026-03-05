return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		preset = "helix",
		spec = {
			{ "<leader>l", group = "[L]sp", icon = { icon = "󰒕", hl = "Keyword" }, mode = { "n", "x" } },
			{ "<leader>f", group = "[F]zf", icon = { icon = "󰍉", hl = "Keyword" }, mode = { "n", "v" } },
			{ "<leader>g", group = "[G]it", icon = { icon = "󰊢", hl = "Keyword" }, mode = { "n", "v" } },
			{ "<leader>O", desc = "Open Oil", icon = { icon = "󰉋", hl = "Keyword" }, mode = { "n", "v" } },
		},
	},
}
