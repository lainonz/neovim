-- Plugin Specifications
-- Semua plugin list ada di sini, konfigurasi ada di config/plugins/

return {
  -- ==================== Colorscheme ====================
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
    config = function()
      require("config.plugins.oxocarbon")
    end,
  },

  -- ==================== Dashboard ====================
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("config.plugins.alpha")
    end,
  },

  -- ==================== Which-Key (Keybinding Helper) ====================
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("config.plugins.which-key")
    end,
  },

  -- ==================== Treesitter ====================
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
      require("config.plugins.treesitter")
    end,
  },

  -- ==================== Telescope ====================
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    },
    config = function()
      require("config.plugins.telescope")
    end,
  },

  -- ==================== LSP ====================
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("config.plugins.lsp")
    end,
  },

  -- ==================== Completion ====================
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP source
      "hrsh7th/cmp-buffer",       -- Buffer source
      "hrsh7th/cmp-path",         -- Path source
      "L3MON4D3/LuaSnip",         -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet source
    },
    config = function()
      require("config.plugins.completion")
    end,
  },

  -- ==================== UI Enhancements ====================
  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("config.plugins.lualine")
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
    },
    config = function()
      require("config.plugins.nvim-tree")
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    config = function()
      require("config.plugins.indent-blankline")
    end,
  },
  
  -- Mini indentscope untuk animated scope indicator
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      symbol = "╎",
      options = { 
        try_as_border = true,
        border = "both",
      },
      draw = {
        delay = 0,
        animation = function()
          return 0
        end,
      },
    },
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
      
      -- Custom highlight untuk border
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#61AFEF" })
    end,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
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
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- ==================== Git Integration ====================
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config.plugins.gitsigns")
    end,
  },
  -- ==================== Terminal ====================
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },
    keys = {
      { "<leader>tf", desc = "Toggle floating terminal" },
      { "<leader>th", desc = "Toggle horizontal terminal" },
      { "<leader>tv", desc = "Toggle vertical terminal" },
    },
    config = function()
      require("config.plugins.toggleterm")
    end,
  },
  -- ==================== Color Preview ====================
  {
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "scss", "html", "javascript", "typescript", "lua" },
    cmd = "ColorizerToggle",
    config = function()
      require("colorizer").setup({
        "css",
        "scss",
        "html",
        "javascript",
        "typescript",
        "lua",
      }, {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      })
    end,
  },

  -- ==================== Commenting ====================
  {
    "numToStr/Comment.nvim",
    keys = {
      { "<leader>/", mode = { "n", "v" }, desc = "Toggle comment" },
    },
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<leader>/",
        },
        opleader = {
          line = "<leader>/",
        },
      })
    end,
  },

  -- ==================== GitHub Copilot ====================
  {
    "github/copilot.vim",
    event = "InsertEnter",
    init = function()
      -- Set this before plugin loads
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
    end,
    config = function()
      -- Accept suggestion dengan Alt-k
      vim.cmd([[
        imap <silent><script><expr> <M-k> copilot#Accept("\<CR>")
      ]])
      
      -- Navigation
      vim.keymap.set("i", "<M-l>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
      vim.keymap.set("i", "<M-h>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
      vim.keymap.set("i", "<M-\\>", "<Plug>(copilot-suggest)", { desc = "Trigger Copilot suggestion" })
      vim.keymap.set("i", "<M-x>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
    end,
  },

  -- Avante.nvim - Modern AI Chat UI (mirip Cursor AI)
  {
    "yetone/avante.nvim",
    lazy = true,
    build = "make",
    cmd = { "AvanteAsk", "AvanteRefresh", "AvanteEdit", "AvanteToggle", "AvanteClear" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "Avante Ask", mode = { "n", "v" } },
      { "<leader>ar", "<cmd>AvanteRefresh<cr>", desc = "Avante Refresh" },
      { "<leader>ae", "<cmd>AvanteEdit<cr>", desc = "Avante Edit", mode = "v" },
      { "<leader>an", "<cmd>AvanteToggle<cr>", desc = "Avante New Chat" },
      { "<leader>ac", "<cmd>AvanteClear<cr>", desc = "Avante Clear Chat" },
    },
    config = function()
      require("config.plugins.avante")
    end,
  },

  -- Dressing.nvim untuk UI improvements (dependency avante)
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- ==================== Discord Rich Presence ====================
  {
    "vyfor/cord.nvim",
    build = "./build",
    event = "VeryLazy",
    opts = function()
      return require("config.plugins.cord")
    end,
  },

  -- Nui.nvim untuk UI components (dependency avante)
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
}
