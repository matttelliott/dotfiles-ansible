-- Neo-tree configuration overrides
-- Shows hidden and ignored files by default

return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		filesystem = {
			filtered_items = {
				visible = true, -- Show hidden files (dotfiles)
				hide_dotfiles = false,
				hide_gitignored = false, -- Show gitignored files
				hide_hidden = false, -- Show hidden files (Windows)
				hide_by_name = {
					-- You can still hide specific files/folders
					".DS_Store",
					"thumbs.db",
				},
			},
			follow_current_file = {
				enabled = false, -- Focus the current file when opening
				leave_dirs_open = true,
			},
		},
	},
}

