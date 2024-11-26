return {
	"andweeb/presence.nvim",
  event = "VeryLazy",
	config = function()
		require("presence").setup({
			auto_update = true,
			neovim_image_text = "The One True Text Editor",
			main_image = "neovim",
			client_id = "1179066608250015835",
			log_level = nil,
			debounce_timeout = 10,
			enable_line_number = false,
			blacklist = { ".env" },
			buttons = true,
			file_assets = {},
			show_time = true,

			editing_text = function(filename)
				return string.format("Editing %s", vim.fn.fnamemodify(filename, ":t"))
			end,
			file_explorer_text = "Browsing files",
			git_commit_text = "Commiting changes",
			plugin_manager_text = "Managing plugins",
			reading_text = function(filename)
				return string.format("Reading %s", vim.fn.fnamemodify(filename, ":t"))
			end,
			workspace_text = function(project_name, filename)
				if project_name then
					return string.format("Working on %s", project_name)
				else
					return string.format("Working on %s", vim.fn.fnamemodify(filename, ":p:h:t"))
				end
			end,
			line_number_text = "Line %s out of %s",
		})

		vim.api.nvim_set_keymap(
			"n",
			"<leader>pu",
			"<CMD>lua package.loaded.presence:update()<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
