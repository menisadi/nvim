return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		preset = "helix",
		spec = {
			{ "<leader>l", group = "[L]sp", mode = { "n", "x" } },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>f", group = "[F]zf" },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			{ "<leader>x", group = "Trouble" },
		},
	},

