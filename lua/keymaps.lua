local map = vim.keymap.set
local defaults = { noremap = true, silent = true }

-- [[ Basic Keymaps ]]
map('n', '<C-s>', ':w<CR>', { desc = '[W]rite' })
map('n', '<leader>a', ':wqa<CR>', { desc = 'Save [A]ll Changes & Exit' }) -- saves all changes and exit all files
map('n', '<leader>x', ':wq<CR>', { desc = 'Save & e[X]it' })

-- Useful for redo-ing
map('n', 'U', '<C-r>', {})

-- Shift + Up/Down to move line up/down
map('n', '<S-Up>', 'yyddkP', defaults)
map('n', '<S-Down>', 'yyddp', defaults)

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Neotree keymaps
map('n', '<C-n>', '<cmd>Neotree filesystem toggle left<CR>', { desc = 'Toggle filetree' })

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Barbar.nvim commands ]]

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', defaults)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', defaults)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', defaults)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', defaults)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', defaults)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', defaults)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', defaults)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', defaults)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', defaults)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', defaults)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', defaults)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', defaults)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', defaults)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', defaults)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', defaults)

-- Goto pinned/unpinned buffer
--      :BufferGotoPinned
--      :BufferGotoUnpinned

-- Close buffer
map('n', '<A-x>', '<Cmd>BufferClose<CR>', defaults)

-- Wipeout buffer
--      :BufferWipeout

-- Close commands
--      :BufferCloseAllButCurrent
--      :BufferCloseAllButPinned
--      :BufferCloseAllButCurrentOrPinned
--      :BufferCloseBuffersLeft
--      :BufferCloseBuffersRight

-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', defaults)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', defaults)

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', defaults)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', defaults)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', defaults)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', defaults)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', defaults)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- Commenting (VScode muscle memory)
-- map('i', '<C-/>', 'gcc', '<Esc>:Commentary<CR>')
map('n', '<C-_>', 'gcc', { remap = true })
map('v', '<C-_>', 'gc', { remap = true })

-- vim: ts=2 sts=2 sw=2 et
