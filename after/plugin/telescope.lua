local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fg', function()
    require('telescope.builtin').live_grep({
        additional_args = function(_)
            return { "--hidden", "--no-ignore" }
        end
    })
end, { desc = "Search Live Grep (including hidden files and ignored)" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
