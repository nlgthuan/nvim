local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>sf', builtin.git_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sh', builtin.help_tags, {desc = '[S]earch [H]elp tags'})
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>sb', builtin.buffers, {desc = '[S]earch [B]uffers'})
vim.keymap.set('n', '<leader>of', builtin.oldfiles, {desc = 'Search [O]ld [F]iles'})

vim.keymap.set('n', '<leader>gs', builtin.git_status, {desc = '[G]it [S]tatus'})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {desc = '[G]it [C]ommits'})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {desc = '[G]it [B]ranches'})

vim.keymap.set('n', '<leader>tb', builtin.builtin, {desc = '[T]elescope [B]uiltins'})
