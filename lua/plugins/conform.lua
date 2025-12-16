return { -- Autoformat
  'stevearc/conform.nvim',
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ lsp_format = 'fallback' })
        vim.cmd('write')
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      ['_'] = { 'insert_final_newline' },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
