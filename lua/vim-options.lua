vim.cmd([["
  set number
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2"
]])

vim.g.mapleader = " "

-- Quick Keys
vim.keymap.set('n', '<leader>q','<cmd>q<cr>')
vim.keymap.set('n', '<leader>w','<cmd>w<cr>')

