return {
  'rose-pine/neovim',
  priority = 1000, -- Make sure to load this plugin first.
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {
      variant = 'main',
      styles = {
        transparency = true,
      },
      highlight_groups = {
        MiniStatuslineFilename = { bg = 'none' },
        MiniStatuslineDevInfo = { bg = 'none' },
        CursorLine = { bg = 'none' },
        TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
        TelescopeNormal = { bg = 'none' },
        TelescopePromptNormal = { bg = 'none' },
        TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
        TelescopeSelection = { fg = 'text', bg = 'none' },
        TelescopeSelectionCaret = { fg = 'rose', bg = 'none' },
      },
    }
    vim.cmd 'colorscheme rose-pine'
  end,
}
