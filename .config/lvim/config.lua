-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "dracula"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Golang",
  t = { "<cmd>GoTestFunc<CR>", "Test func" },
  T = { "<cmd>GoTest<CR>", "Test package" },
  v = { "<cmd>GoVet<CR>", "Vet" },
  b = { "<cmd>GoDebugBreakpoint<CR>", "Insert breakpoint" },
  d = { "<cmd>GoDebugTestFunc<CR>", "Debug test func" },
  c = { "<cmd>GoDebugContinue<CR>", "Debug continue" },
}

lvim.builtin.which_key.mappings["r"] = {
  "<cmd>Trouble document_diagnostics<cr>",
  "Diagnostics",
}



-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "go",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.transparent_window = true

-- Plugins
lvim.plugins = {
  {
    "fatih/vim-go",
    config = function()
      vim.cmd("let g:go_doc_keywordprg_enabled = 0")
    end
  },
  { "dracula/vim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local lsp_installer_servers = require "nvim-lsp-installer.servers"
      local _, requested_server = lsp_installer_servers.get_server "rust_analyzer"
      require("rust-tools").setup({
        tools = {
          autoSetHints = true,
          hover_with_actions = true,
          runnables = {
            use_telescope = true,
          },
        },
        server = {
          cmd_env = requested_server._default_options.cmd_env,
          on_attach = require("lvim.lsp").common_on_attach,
          on_init = require("lvim.lsp").common_on_init,
        },
      })
    end,
    ft = { "rust", "rs" },
  },
}
