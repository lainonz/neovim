-- Treesitter configuration (updated API)
local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

-- Setup via config module
require("nvim-treesitter.config").setup({
  -- Install parser secara otomatis
  auto_install = true,
  
  -- Daftar parser yang wajib di-install
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "python",
    "javascript",
    "typescript",
    "json",
    "html",
    "css",
    "markdown",
    "markdown_inline",
  },
  
  -- Sync install (hanya saat pertama kali)
  sync_install = false,
  
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  
  indent = {
    enable = true,
  },
})
