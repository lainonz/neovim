# Neovim Configuration

Konfigurasi Neovim yang dirancang untuk menjadi minimalis sekaligus modular, memberikan pengalaman coding yang lebih produktif dan efisien. Dengan setup ini, pengguna dapat dengan mudah mengelola plugin, mengoptimalkan alur kerja, dan memanfaatkan fitur modern Neovim.

## 📁 Struktur

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Bootstrap lazy.nvim
│   │   ├── options.lua        # Vim options
│   │   ├── keymaps.lua        # Keybindings
│   │   └── plugins/           # Plugin configurations
│   │       ├── catppuccin.lua
│   │       ├── treesitter.lua
│   │       ├── telescope.lua
│   │       ├── lsp.lua
│   │       ├── completion.lua
│   │       ├── lualine.lua
│   │       ├── nvim-tree.lua
│   │       ├── indent-blankline.lua
│   │       └── gitsigns.lua
│   └── plugins/
│       └── init.lua           # Semua plugin specs (install list)
└── README.md
```

## 🚀 Instalasi

1. **Backup Konfigurasi Lama** (Jika ada sebelumnya):
   Pastikan menyimpan salinan konfigurasi lama untuk menghindari kehilangan data.

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. **Persiapkan Lingkungan**:
   - Pastikan Neovim versi terbaru telah diinstall (minimal versi 0.7 ke atas). Anda dapat menggunakan perintah:
```bash
nvim --version
```

3. **Clone Repository**:
   Jika ini adalah langkah pertama Anda, salin konfigurasi ke direktori yang sesuai:
```bash
git clone <URL-Repository-Config> ~/.config/nvim
```

4. **Buka Neovim**:
   Jalankan Neovim untuk pertama kalinya:
```bash
nvim
```

   - Lazy.nvim, sebagai pengelola plugin, akan otomatis menginstall semua plugin yang diperlukan.

## ⚙️ Cara Konfigurasi dan Penggunaan

**Memulai dengan Konfigurasi Neovim:**
Setup konfigurasi Neovim dirancang untuk langsung siap digunakan dengan struktur direktori yang jelas (lihat bagian Struktur). Berikut langkah-langkah untuk menggunakan fitur utama:

1. **Plugin Manager (Lazy.nvim):**
   - Kelola semua plugin melalui Lazy.nvim.
   - Jalankan `:Lazy` dalam Neovim untuk membuka interface pengelolaan plugin. Anda dapat menambah, menghapus, memperbarui, atau melihat status plugin.

2. **Custom Keymaps:**
   Keymaps telah disiapkan untuk memberikan pengalaman yang efisien. Lihat bagian Keymaps berikut untuk melihat kombinasi tombol utama yang tersedia atau tambahkan keymaps Anda sendiri di `lua/config/keymaps.lua`.

3. **Pengaturan:**
   Sesuaikan opsi editor Anda di `lua/config/options.lua`. Disertakan contoh untuk fleksibilitas maksimal, seperti pengaturan tab width, encoding, dan lainnya.

4. **Debugging dan Troubleshooting:**
   - Gunakan `:checkhealth` untuk memeriksa status konfigurasi.
   - Pastikan semua dependencies telah terpenuhi.

## ⌨️ Keymaps Utama

**Leader key:** `Space`

### Navigasi Window
- `Ctrl-h/j/k/l` - Pindah antar window
- `Ctrl-Arrow` - Resize window

### Buffer
- `Shift-h` - Buffer sebelumnya
- `Shift-l` - Buffer berikutnya
- `<leader>bd` - Hapus buffer

### File Explorer
- `<leader>e` - Toggle file explorer

### Telescope
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fr` - Recent files
- `<leader>fh` - Help tags

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>rn` - Rename
- `<leader>ca` - Code action

### Git
- `]c` - Next git hunk
- `[c` - Previous git hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line

### Lainnya
- `<leader>w` - Save file
- `Esc` - Clear search highlight

## 🔧 Menambah Plugin

**1. Buat plugin spec** di `lua/plugins/`, contoh:

```lua
-- lua/plugins/nama-plugin.lua
return {
  {
    "Tambahkan plugin spec** di `lua/plugins/init.lua`:

```lua
-- lua/plugins/init.lua
return {
  -- ... plugin lain ...
  
  -- Plugin baru
  {
    "username/plugin-name",
    config = function()
      require("config.plugins.nama-plugin")
    end,
  },
}
```

**2. Buat file konfigurasi** di `lua/config/plugins/`:

```lua
-- lua/config/plugins/nama-plugin.lua
require("plugin-name").setup({
  -- Konfigurasi plugin di sini
})
```

Plugin akan otomatis diload oleh lazy.nvim. Semua list plugin ada di satu tempat, konfigurasi terpisah per plugin
- **telescope.nvim** - Fuzzy finder
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP/DAP/linter installer
- **nvim-cmp** - Autocompletion
- **lualine.nvim** - Statusline
- **nvim-tree** - File explorer
- **indent-blankline** - Indent guides
- **gitsigns** - Git integration

## 🎨 Ganti Colorscheme

Edit `lua/plugins/colorscheme.lua` dan ganti plugin atau flavour.

## 📝 Tips

- Jalankan `:checkhealth` untuk cek setup
- Gunakan `:Lazy` untuk manage plugins
- Gunakan `:Mason` untuk manage LSP servers
- File konfigurasi sangat readable, edit sesuai kebutuhan
