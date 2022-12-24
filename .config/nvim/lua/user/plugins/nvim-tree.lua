require("nvim-tree").setup({

	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = false,
	sync_root_with_cwd = true,

	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			error = " ",
			warning = " ",
			hint = " ",
			info = " ",
		},
	},

	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		timeout = 400,
	},

	actions = {
		open_file = {
			quit_on_open = true,
		},
	},

	renderer = {
		icons = {
			show = {
				folder_arrow = false,
			},
		},
	},

	view = {
		--hide_root_folder = true,
		width = 40,
		mappings = {
			list = {
				{ key = "<Space>", action = "vsplit" },
			},
		},
	},
})
