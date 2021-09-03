-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<A-h>"] = "<cmd>lua require('Navigator').left()<CR>"
lvim.keys.normal_mode["<A-k>"] = "<cmd>lua require('Navigator').up()<CR>"
lvim.keys.normal_mode["<A-l>"] = "<cmd>lua require('Navigator').right()<CR>"
lvim.keys.normal_mode["<A-j>"] = "<cmd>lua require('Navigator').down()<CR>"
lvim.keys.normal_mode["<A-p>"] = "<cmd>lua require('Navigator').prevous()<CR>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings['g']['y'] = { "<cmd>lua require'gitlinker'.get_buf_range_url('n')<cr>", "Copy current git to clipboard" }
lvim.builtin.which_key.mappings['g']['P'] = { "<cmd>Telescope gh pull_request<cr>", "Copy current git to clipboard" }
lvim.builtin.which_key.mappings["j"] = {
  name = "+Journal",
  a = { "<cmd>DearDiarySelectJournal<CR>", "Select active journal" },
  d = {
    name = "+Daily",
    c = { "<cmd>DearDiaryToday<CR>", "Go to entry for today" },
    n = { "<cmd>DearDiaryTomorrow<CR>", "Go to entry for tomorrow"},
    p = { "<cmd>DearDiaryYesterday<CR>", "Go to entry for yesterday"},
  },
  w = {
    name = "+Weekly",
    c = { "<cmd>DearDiaryThisWeek<CR>", "Go to entry for this week" },
    n = { "<cmd>DearDiaryNextWeek<CR>", "Go to entry for next week" },
    p = { "<cmd>DearDiaryLastWeek<CR>", "Go to entry for last week" },
  },
  m = {
    name = "+Monthly",
    c = { "<cmd>DearDiaryThisMonth<CR>", "Go to entry for this month" },
    n = { "<cmd>DearDiaryNextMonth<CR>", "Go to entry for next month" },
    p = { "<cmd>DearDiaryLastMonth<CR>", "Go to entry for last month" },
  }
}
lvim.builtin.which_key.mappings["w"] = {
  name = "+Window/Splits",
  n = { ":new<CR>", "Open a new window" },
  c = { ":close<CR>", "Close current window" },
  o = { ":only<CR>", "Close all other windows" },
  h = { "<C-w>h", "Focus window left" },
  j = { "<C-w>j", "Focus window down" },
  k = { "<C-w>k", "Focus window up" },
  l = { "<C-w>l", "Focus window right" },
  m = { ":wincmd _<cr>:wincmd \\|<cr>", "Maximize window" }
}
lvim.builtin.which_key.mappings["w"]["-"] = { ":split<CR>", "Split horizontal" }
lvim.builtin.which_key.mappings["w"]["/"] = { ":vsplit<CR>", "Split vertical" }
lvim.builtin.which_key.mappings["w"]["]"] = { ":resize +5<CR>", "Enlarge window" }
lvim.builtin.which_key.mappings["w"]["["] = { ":resize -5<CR>", "Shrink window" }
lvim.builtin.which_key.mappings["w"]["="] = { ":wincmd =<CR>", "Reset window evenly" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}
lvim.builtin.which_key.mappings["<tab>"] = { "<cmd>BufferPrevious<cr>", "Last buffer" }
lvim.builtin.which_key.mappings["'"] = { "<cmd>ToggleTerm<cr>", "Show terminal" }
lvim.builtin.which_key.mappings["/"] = { "<cmd>Telescope find_files<cr>", "Search in project" }
lvim.builtin.which_key.mappings[";"] = { "<cmd>CommentToggle<cr>", "Comment" }
lvim.builtin.which_key.mappings["b"]["d"] = { "<cmd>BufferClose!<cr>", "Close buffer" }
lvim.builtin.which_key.mappings["b"]["n"] = { "<cmd>BufferNext<cr>", "Next buffer" }
lvim.builtin.which_key.mappings["b"]["p"] = { "<cmd>BufferPrevious<cr>", "Previous buffer" }
lvim.builtin.which_key.mappings["b"]["s"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search in current buffer" }
lvim.builtin.which_key.mappings["f"] = {
  name = "+File",
  f = { "<cmd>Telescope file_browser<cr>", "Open file/folder" },
  s = { "<cmd>w!<cr>", "Save file" },
  S = { "<cmd>wa!<cr>", "Save all files" },
  t = { "<cmd>NvimTreeToggle<cr>", "Toggle file tree" },
  T = { "<cmd>NvimTreeFindFile<cr>", "Show active file in file tree" },
  r = { "<cmd>Telescope oldfiles<cr>", "Open recent" }
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "right"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.telescope.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
lvim.lang.typescript.formatters = { { exe = "eslint_d" }, { exe = "prettier"} }
lvim.lang.typescriptreact.formatters = lvim.lang.typescript.formatters
lvim.lang.javascript.formatters = lvim.lang.typescript.formatters
lvim.lang.javascriptreact.formatters = lvim.lang.typescript.formatters

lvim.lang.typescript.linters = { { exe = "eslint_d" } }
lvim.lang.typescriptreact.linters = lvim.lang.typescript.linters
lvim.lang.javascript.linters = lvim.lang.typescript.linters
lvim.lang.javascriptreact.linters = lvim.lang.typescript.linters

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }
lvim.plugins = {
  {"LunarVim/colorschemes"},
  {"Th3Whit3Wolf/space-nvim"},
  {
    "tpope/vim-surround",
    keys = {"c", "d", "y"}
  },
  {
    "tpope/vim-bundler",
    cmd = {"Bundler", "Bopen", "Bsplit", "Btabedit"}
  },
  {
    "tpope/vim-rails",
    cmd = {
      "Eview",
      "Econtroller",
      "Emodel",
      "Sview",
      "Scontroller",
      "Smodel",
      "Vview",
      "Vcontroller",
      "Vmodel",
      "Tview",
      "Tcontroller",
      "Tmodel",
      "Rails",
      "Generate",
      "Runner",
      "Extract"
    },
    {
      "ruifm/gitlinker.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("gitlinker").setup()
      end
    },
    {
      "ishchow/nvim-deardiary",
      config = function()
        local config = require("deardiary.config")
        config.journals = {
          {
            path = "~/journals/work",
            frequencies = {"daily", "weekly", "monthly", "yearly"}
          },
          {
            path = "~/journals/personal",
            frequencies = {"daily"}
          }
        }
      end
    },
    {
      "numToStr/Navigator.nvim",
      config = function ()
        require('Navigator').setup()
      end
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "nvim-telescope/telescope-github.nvim",
      config = function ()
        require('telescope').load_extension('gh')
      end
    }
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
