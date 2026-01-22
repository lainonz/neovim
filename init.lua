-- Set leader key SEBELUM lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
require("config.lazy")

-- Load konfigurasi dasar
require("config.options")
require("config.keymaps")
