return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		preset = "helix",
		icons = {
			mappings = vim.g.have_nerd_font,
		},
		spec = {
			{ "<leader>l", group = "[L]sp", mode = { "n", "x" } },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>f", group = "[F]zf" },
			{ "<leader>r", group = "[R]ender" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			{ "<leader>x", group = "Trouble" },
		},
	},
}
