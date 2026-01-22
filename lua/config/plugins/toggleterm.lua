-- Terminal configuration with toggleterm
require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  persist_mode = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  auto_scroll = true,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

-- Terminal keymaps
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Custom terminal instances
local Terminal = require("toggleterm.terminal").Terminal

-- Floating terminal
local float_term = Terminal:new({
  direction = "float",
  float_opts = {
    border = "curved",
  },
})

function _FLOAT_TERM_TOGGLE()
  float_term:toggle()
end

-- Horizontal terminal
local horizontal_term = Terminal:new({
  direction = "horizontal",
  size = 15,
})

function _HORIZONTAL_TERM_TOGGLE()
  horizontal_term:toggle()
end

-- Vertical terminal
local vertical_term = Terminal:new({
  direction = "vertical",
})

function _VERTICAL_TERM_TOGGLE()
  vertical_term:toggle()
end

-- LazyGit integration
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  hidden = true,
  float_opts = {
    border = "curved",
    width = function()
      return math.floor(vim.o.columns * 0.9)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.9)
    end,
  },
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

-- Keymaps untuk toggle terminals
vim.keymap.set("n", "<leader>tf", "<cmd>lua _FLOAT_TERM_TOGGLE()<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("n", "<leader>th", "<cmd>lua _HORIZONTAL_TERM_TOGGLE()<CR>", { desc = "Toggle horizontal terminal" })
vim.keymap.set("n", "<leader>tv", "<cmd>lua _VERTICAL_TERM_TOGGLE()<CR>", { desc = "Toggle vertical terminal" })
vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Toggle LazyGit" })
