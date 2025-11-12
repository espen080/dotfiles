-- Python virtual environment selector: https://github.com/linux-cultist/venv-selector.nvim/tree/regexp
-- Install fd-find:
-- apt install fd-find
-- Link binary:
-- ln -s $(which fdfind) ~/.local/bin/fd
return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python', --optional
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  },
  ft = 'python', -- Load when opening Python files
  keys = {
    { '<leader>v', '<cmd>VenvSelect<cr>' }, -- Open picker on keymap
  },
  opts = { -- this can be an empty lua table - just showing below for clarity.
    search = {}, -- if you add your own searches, they go here.
    options = {}, -- if you add plugin options, they go here.
  },
}
