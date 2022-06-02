require("hop").setup{}

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader><leader>w", ":HopWord<CR>")
map("n", "<leader><leader>j", ":HopLine<CR>")
map("n", "<leader><leader>f", ":HopChar1<CR>")
map("n", "<leader><leader>t", ":HopChar2<CR>")
