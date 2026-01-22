-- Indent blankline configuration dengan warna simple
require("ibl").setup({
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = true,
    show_exact_scope = true,
  },
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
      "NvimTree",
    },
    buftypes = {
      "terminal",
      "nofile",
    },
  },
})

-- Explicitly disable untuk NvimTree
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function()
    require("ibl").setup_buffer(0, { enabled = false })
  end,
})
