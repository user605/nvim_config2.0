vim.g.mapleader = ";"

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- moving among splits
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("i", "<C-h>", [[<C-\><C-N><C-w>h]])
map("i", "<C-j>", [[<C-\><C-N><C-w>j]])
map("i", "<C-k>", [[<C-\><C-N><C-w>k]])
map("i", "<C-l>", [[<C-\><C-N><C-w>l]])
map("t", "<C-h>", [[<C-\><C-N><C-w>h]])
map("t", "<C-j>", [[<C-\><C-N><C-w>j]])
map("t", "<C-k>", [[<C-\><C-N><C-w>k]])
map("t", "<C-l>", [[<C-\><C-N><C-w>l]])

-- visual movement
map("n", "j", "gj")
map("n", "k", "gk")

-- fast movement
map("n", "<S-up>", "10k")
map("n", "<S-down", "10j")
map("n", "<S-left>", "10h")
map("n", "<S-right>", "10l")

-- toggle relative numbers
map("n", "<F12>", ":set rnu!<CR>")
map("i", "<F12>", ":set rnu!<CR>")

-- toggle wrap
map("n", "<F10>", ":setlocal wrap!<CR>")

-- create splits
map("n", "<leader>v", ":vsplit<CR>")
map("n", "<leader>s", ":split<CR>")

-- move block of text
map("n", "<A-k>", ":m .-2<CR>==")
map("n", "<A-j>", ":m .+1<CR>==")
map("i", "<A-k>", "<ESC>:m .-2<CR>==gi")
map("i", "<A-j>", "<ESC>:m .+1<CR>==gi")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- better yanking
map("n", "Y", "y$")
map("n", "<leader>y", ":%y<CR>")

-- quickfix list TODO

-- make life easier
map("n", "0", "^")
map("n", "^", "0")

-- save me
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>w", ":w<CR>")
-- map commands TODO

-- clear highlights
map("n", "<leader>c", ":noh<CR>")

-- resize splits
map("n", "<A-H>", ":CmdResizeLeft<cr>")
map("n", "<A-J>", ":CmdResizeDown<cr>")
map("n", "<A-K>", ":CmdResizeUp<cr>")
map("n", "<A-L>", ":CmdResizeRight<cr>")

-- terminal config
map("n", "<leader>tt", ":term<CR>")
map("n", "<leader>tv", ":60vsplit +term<CR>")
map("n", "<leader>ts", ":20split +term<CR>")

-- escape terminal mode
map("t", "<Esc>", [[<C-\><C-n>]])

-- TODO auto cmd commands
