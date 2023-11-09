-- install lazy if not installed on this machine
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- first time startup?
-- local packer_bootstrap = ensure_packer()


require('lazy').setup({
  -- Git
  { 'tpope/vim-fugitive' },
  {
    'tommcdo/vim-fubitive',
    enabled = false,
    config = function() require('plugins.fubitive') end,
  },
  { 'junegunn/gv.vim' },

  -- Theme
  {
    "mcchrish/zenbones.nvim",
    dependencies = 'rktjmp/lush.nvim'
  },
  { "catppuccin/nvim", as = "catppuccin" },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function () require('plugins.lualine') end,
  },

  -- syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSupdate',
    config = function() require('plugins.treesitter') end
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function () require('plugins.telescope') end,
  },

  -- Misc
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function () require('plugins.trouble') end,
  },
  { 'Darazaki/indent-o-matic' },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {},
    config = function () require('plugins.indent') end,
  },
  { 'elkowar/yuck.vim' },
  {
    'mfussenegger/nvim-dap',
    config = function() require('plugins.dap') end,
  },
  { 'mxsdev/nvim-dap-vscode-js' },
  {
    'microsoft/vscode-js-debug',
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
  },
  { 'Civitasv/cmake-tools.nvim' },
  {
    'editorconfig/editorconfig-vim',
    config = function() require('plugins.editorconfig') end,
  },
  {
    'LucHermitte/alternate-lite',
    dependencies = 'LucHermitte/lh-vim-lib'
  },
  { 'dstein64/vim-startuptime' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        run = function() pcall(vim.cmd, 'MasonUpdate') end
      },
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip', version = "v2.*", build = 'make install_jsregexp'},
      {'rafamadriz/friendly-snippets'},
    },
    config = function() require('plugins.lsp') end
  },
})


