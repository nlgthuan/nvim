require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	-- All formatter configurations are opt-in
	filetype = {
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			-- function()
			-- 	-- Supports conditional formatting
			-- 	if util.get_current_buffer_file_name() == "special.lua" then
			-- 		return nil
			-- 	end

			-- 	-- Full specification of configurations is down below and in Vim help
			-- 	-- files
			-- 	return {
			-- 		exe = "stylua",
			-- 		args = {
			-- 			"--search-parent-directories",
			-- 			"--stdin-filepath",
			-- 			util.escape_path(util.get_current_buffer_file_path()),
			-- 			"--",
			-- 			"-",
			-- 		},
			-- 		stdin = true,
			-- 	}
			-- end,
		},
		python = {
			require("formatter.filetypes.python").isort,
			require("formatter.filetypes.python").black,
		},
        javascript = {
            require("formatter.filetypes.javascript").prettier,
        },
        typescript = {
            require("formatter.filetypes.javascript").prettier,
        },
        javascriptreact = {
            require("formatter.filetypes.javascript").prettier,
        },
        typescriptreact = {
            require("formatter.filetypes.javascript").prettier,
        },
        json = {
            require("formatter.filetypes.json").prettier,
        },
        css = {
            require("formatter.filetypes.css").prettier,
        },
        go = {
            require("formatter.filetypes.go").gofmt,
            require("formatter.filetypes.go").goimports,
        },
        html = {
            require("formatter.filetypes.html").prettier,
        },
        templ = {
            require("formatter.filetypes.html").prettier,
        },
        sql = {
            require("formatter.filetypes.sql").sqlfluff,
        },
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
