return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		preset = "helix",
		spec = {
			{ "<leader>l", group = "[L]sp", icon = "", mode = { "n", "x" } },
			{ "<leader>f", group = "[F]zf", icon = "", mode = { "n", "v" } },
			{ "<leader>g", group = "[G]it", icon = "", mode = { "n", "v" } },
			{ "<leader>O", desc = "Open Oil", icon = "", mode = { "n", "v" } },
		},
	},
}
