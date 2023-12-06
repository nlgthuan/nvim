local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, opts)
  vim.keymap.set("n", "gr",require('telescope.builtin').lsp_references, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>gl", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'lua_ls', 'eslint'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
	    local lua_opts = lsp_zero.nvim_lua_ls()
	    require('lspconfig').lua_ls.setup(lua_opts)
    end,
    pyright = function()
        local util = require('lspconfig/util')

        local path = util.path

        local function get_python_path(workspace)
            -- Use activated virtualenv.
            if vim.env.VIRTUAL_ENV then
                return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
            end

            -- Find and use virtualenv in workspace directory.
            for _, pattern in ipairs({'*', '.*'}) do
                local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
                if match ~= '' then
                    return path.join(path.dirname(match), 'bin', 'python')
                end
            end

            -- Fallback to system Python.
            return 'python'
        end

        require('lspconfig').pyright.setup({
            before_init = function(_, config)
                config.settings.python.pythonPath = get_python_path(config.root_dir)
            end,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        typeCheckingMode = 'off',
                    },
                },
            },
        })
    end,
  },
})

local cmp = require('cmp')
cmp.setup({
	sources = {
		{name = 'path'},
		{name = 'nvim_lsp'},
		{name = 'nvim_lua'},
	},
	formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = true}),
    })
})

