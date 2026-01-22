-- Oxocarbon colorscheme configuration dengan transparent background

-- Set colorscheme
vim.opt.background = "dark"
vim.cmd.colorscheme("oxocarbon")

-- Transparent background untuk semua window dan UI elements
local function set_transparent()
  local highlights = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "StatusLine",
    "StatusLineNC",
    "WinSeparator",
    "VertSplit",
    "EndOfBuffer",
    "LineNr",
    "CursorLineNr",
    "Folded",
    "FoldColumn",
    -- Telescope
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptNormal",
    "TelescopePromptBorder",
    "TelescopeResultsNormal",
    "TelescopeResultsBorder",
    "TelescopePreviewNormal",
    "TelescopePreviewBorder",
    -- NvimTree
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NvimTreeEndOfBuffer",
    -- Completion menu
    "Pmenu",
    "PmenuSbar",
    "PmenuThumb",
  }
  
  for _, group in ipairs(highlights) do
    vim.cmd(string.format("highlight %s guibg=NONE ctermbg=NONE", group))
  end
end

-- Apply transparent setelah colorscheme loaded
set_transparent()

-- Reapply saat colorscheme berubah
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_transparent,
})
