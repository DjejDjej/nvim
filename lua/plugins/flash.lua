return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		max_length = 10,
		no_quickfix = true,
		treesitter = true,

	},
	keys = {
		{ "q",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
	},
}

