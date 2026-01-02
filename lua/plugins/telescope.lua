return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = { ['<c-q>'] = 'smart_send_to_qflist' },
        },
      },
    }
    require("config.telescope.multigrep").setup()

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>sc', function()
      builtin.find_files { cwd = vim.fn.stdpath("config") }
    end, { desc = 'Telescope find config' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set("n", "<leader>gr", builtin.lsp_references)
    vim.keymap.set("n", "gd", builtin.lsp_definitions)
    vim.keymap.set("n", "gI", builtin.lsp_implementations)
  end
}
