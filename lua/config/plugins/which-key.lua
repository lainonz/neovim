-- Which-Key configuration (Keybinding helper)
local wk = require("which-key")

wk.setup({
  preset = "modern",
  delay = 1000,
  icons = {
    rules = false,
  },
})

-- Definisi keybindings dengan which-key v3 API
wk.add({
  -- File/Find operations
  { "<leader>f", group = "Find (Telescope)" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
  
  -- Buffer operations
  { "<leader>b", group = "Buffer" },
  { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete Buffer" },
  
  -- Copilot/AI operations
  { "<leader>c", group = "Copilot/Code" },
  { "<leader>ca", "<cmd>Copilot<cr>", desc = "Copilot Commands" },
  
  -- Avante AI operations
  { "<leader>a", group = "AI (Avante)" },
  { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "Ask AI" },
  { "<leader>ar", "<cmd>AvanteRefresh<cr>", desc = "Refresh" },
  { "<leader>ae", "<cmd>AvanteEdit<cr>", desc = "Edit with AI" },
  
  -- Git operations
  { "<leader>h", group = "Git Hunk" },
  { "<leader>hs", desc = "Stage Hunk" },
  { "<leader>hr", desc = "Reset Hunk" },
  { "<leader>hp", desc = "Preview Hunk" },
  { "<leader>hb", desc = "Blame Line" },
  
  -- LazyGit
  { "<leader>g", group = "Git" },
  { "<leader>gg", desc = "LazyGit" },
  
  -- Terminal
  { "<leader>t", group = "Terminal" },
  { "<leader>tf", desc = "Floating Terminal" },
  { "<leader>th", desc = "Horizontal Terminal" },
  { "<leader>tv", desc = "Vertical Terminal" },
  
  -- File explorer
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
  
  -- Save
  { "<leader>w", "<cmd>w<cr>", desc = "Save File" },
  
  -- Comment
  { "<leader>/", desc = "Toggle Comment" },
})
