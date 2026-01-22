-- Cord.nvim - Discord Rich Presence
-- Comprehensive customizable configuration

return {
  -- Core settings
  enabled = true,
  log_level = vim.log.levels.OFF,

  -- Editor settings
  editor = {
    client = "neovim",
    tooltip = "Neovim - The Superior Text Editor",
    icon = nil, -- Uses default Neovim icon
  },

  -- Display settings
  display = {
    theme = "classic", -- Options: 'default', 'atom', 'catppuccin', 'minecraft', 'classic'
    flavor = "dark", -- Options: 'dark', 'light', 'accent'
    view = "full", -- Options: 'full', 'editor', 'asset', 'auto'
    swap_fields = false, -- Show workspace before filename
    swap_icons = false, -- Use editor icon as large image
  },

  -- Timestamp settings
  timestamp = {
    enabled = true, -- Show elapsed time
    reset_on_idle = false, -- Don't reset time when idle
    reset_on_change = false, -- Don't reset when switching files
    shared = false, -- Don't share timestamp across all buffers
  },

  -- Idle detection settings
  idle = {
    enabled = true, -- Enable idle detection
    timeout = 300000, -- 5 minutes in milliseconds
    show_status = true, -- Show idle status
    ignore_focus = true, -- Consider idle even when focused
    unidle_on_focus = true, -- Return from idle on focus
    smart_idle = true, -- Smart idle detection
    details = "Idling",
    state = nil,
    tooltip = "💤",
    icon = nil,
  },

  -- Text templates
  text = {
    -- Default text for all activities if not overridden
    default = nil,
    
    -- Workspace activity
    workspace = function(opts)
      return "Working in " .. opts.workspace
    end,
    
    -- Viewing files (read-only)
    viewing = function(opts)
      return "Viewing " .. opts.filename
    end,
    
    -- Editing files
    editing = function(opts)
      return "Editing " .. opts.filename
    end,
    
    -- File browser activity
    file_browser = function(opts)
      return "Browsing files in " .. opts.name
    end,
    
    -- Plugin manager activity
    plugin_manager = function(opts)
      return "Managing plugins in " .. opts.name
    end,
    
    -- LSP activity
    lsp = function(opts)
      return "Configuring LSP in " .. opts.name
    end,
    
    -- Documentation
    docs = function(opts)
      return "Reading " .. opts.name .. " docs"
    end,
    
    -- Version control
    vcs = function(opts)
      return "Committing changes in " .. opts.name
    end,
    
    -- Notes
    notes = function(opts)
      return "Taking notes in " .. opts.name
    end,
    
    -- Debugging
    debug = function(opts)
      return "Debugging in " .. opts.name
    end,
    
    -- Testing
    test = function(opts)
      return "Testing in " .. opts.name
    end,
    
    -- Diagnostics/problems
    diagnostics = function(opts)
      return "Fixing problems in " .. opts.name
    end,
    
    -- Games
    games = function(opts)
      return "Playing " .. opts.name
    end,
    
    -- Terminal
    terminal = function(opts)
      return "Running commands in " .. opts.name
    end,
    
    -- Dashboard
    dashboard = "Home",
  },

  -- Buttons (shown in Discord profile)
  -- buttons = nil,
  -- Example buttons configuration:
  buttons = {
    {
      label = "View Repository",
      url = function(opts)
        -- return opts.repo_url or "https://github.com"
        return opts.repo_url
      end,
    },
    -- {
    --   label = "My Website",
    --   url = "https://example.com",
    -- },
  },

  -- Custom assets (override default icons)
  assets = nil,
  -- Example assets configuration:
  -- assets = {
  --   [".rs"] = {
  --     icon = "rust",
  --     tooltip = "Rust",
  --     text = "Writing in Rust"
  --   },
  --   ["init.lua"] = {
  --     icon = "lua",
  --     tooltip = "Lua Configuration",
  --     type = "language"
  --   },
  -- },

  -- Custom variables for use in templates
  variables = nil,
  -- Example variables:
  -- variables = {
  --   custom_var = "value",
  --   dynamic_var = function(opts)
  --     return "dynamic value"
  --   end,
  -- },

  -- Hooks for custom behavior
  hooks = {
    -- Called when connected and ready
    ready = nil,
    -- ready = function(manager)
    --   print("Discord RPC Ready!")
    -- end,
    
    -- Called when shutting down
    shutdown = nil,
    
    -- Called before building activity
    pre_activity = nil,
    -- pre_activity = function(opts)
    --   -- Modify opts before activity is built
    --   return opts
    -- end,
    
    -- Called after building activity, before sending
    post_activity = nil,
    -- post_activity = function(opts, activity)
    --   -- Modify activity before sending to Discord
    --   return activity
    -- end,
    
    -- Called when entering idle state
    idle_enter = nil,
    
    -- Called when leaving idle state
    idle_leave = nil,
    
    -- Called when workspace changes
    workspace_change = nil,
    
    -- Called when entering a buffer
    buf_enter = nil,
  },

  -- Plugins (built-in cord plugins)
  plugins = nil,
  -- Example plugins:
  -- plugins = {
  --   "cord.plugins.diagnostics", -- Show diagnostics count
  --   "cord.plugins.local_time", -- Show local time instead of elapsed
  --   ["cord.plugins.visibility"] = { -- Control visibility per workspace
  --     override = true,
  --     rules = {
  --       blacklist = {
  --         "private",
  --         "~/secret-project",
  --       },
  --     },
  --   },
  -- },

  -- Advanced settings
  advanced = {
    -- Plugin behavior
    plugin = {
      autocmds = true, -- Enable autocmds
      cursor_update = "on_hold", -- Options: 'on_move', 'on_hold'
      match_in_mappings = true, -- Match file extensions in mappings
    },
    
    -- Server settings
    server = {
      update = "fetch", -- Options: 'fetch', 'install', 'build', 'none'
      pipe_path = nil, -- Custom IPC pipe path
      executable_path = nil, -- Custom server executable path
      timeout = 300000, -- 5 minutes timeout
    },
    
    -- Discord connection settings
    discord = {
      pipe_paths = nil, -- Custom Discord IPC pipe paths
      
      -- Reconnection settings
      reconnect = {
        enabled = false, -- Enable auto-reconnect
        interval = 5000, -- 5 seconds between reconnect attempts
        initial = true, -- Reconnect if initial connection fails
      },
      
      -- Sync settings
      sync = {
        enabled = true, -- Enable sync logic
        mode = "periodic", -- Options: 'periodic', 'defer'
        interval = 12000, -- 12 seconds sync interval
        reset_on_update = true, -- Reset periodic sync on activity updates
        pad = true, -- Pad activity fields with whitespace
      },
    },
    
    -- Workspace detection settings
    workspace = {
      root_markers = {
        ".git",
        ".hg",
        ".svn",
      },
      limit_to_cwd = false, -- Limit workspace detection to current working directory
    },
  },
}
