-- General settings
local opt = vim.opt

-- UI
opt.number = true           -- Tampilkan nomor baris
opt.relativenumber = true   -- Nomor relatif
opt.signcolumn = "yes"      -- Kolom untuk signs
opt.cursorline = true       -- Highlight baris cursor
opt.termguicolors = true    -- True color support
opt.showmode = false        -- Hide mode (ditampilkan di statusline)

-- Indentasi
opt.tabstop = 2             -- 2 spasi untuk tab
opt.shiftwidth = 2          -- 2 spasi untuk indent
opt.expandtab = true        -- Gunakan spasi bukan tab
opt.smartindent = true      -- Auto indent
opt.breakindent = true      -- Wrapped lines indent

-- Search
opt.ignorecase = true       -- Case insensitive
opt.smartcase = true        -- Case sensitive jika ada huruf besar
opt.hlsearch = true         -- Highlight search

-- Split windows
opt.splitright = true       -- Split vertical ke kanan
opt.splitbelow = true       -- Split horizontal ke bawah

-- File handling
opt.swapfile = false        -- Disable swap file
opt.backup = false          -- Disable backup
opt.undofile = true         -- Enable persistent undo
opt.updatetime = 250        -- Faster completion

-- Editor
opt.scrolloff = 8           -- Keep 8 lines di atas/bawah cursor
opt.wrap = false            -- Disable line wrap
opt.mouse = "a"             -- Enable mouse
opt.clipboard = "unnamedplus" -- Use system clipboard

-- Performance
opt.timeoutlen = 400        -- Faster keymap timeout (but not too fast for which-key)
opt.completeopt = "menu,menuone,noselect"
opt.lazyredraw = false
opt.ttyfast = true

-- Disable unused builtin plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
