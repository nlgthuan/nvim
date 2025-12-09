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
  end
}
