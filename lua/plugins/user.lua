-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = {
      "VimBeGood"
    }
  },

  -- File explorer bonito com ícones (Neo-tree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
    },
    opts = {
      close_if_last_window = true,
      window = { width = 30 },
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      default_source = "filesystem",
      sources = { "filesystem", "git_status", "buffers" },
      source_selector = {
        winbar = true,
        statusline = false,
        content_layout = "center",
        sources = {
          { source = "filesystem", display_name = "Files" },
          { source = "git_status", display_name = "Git" },
          { source = "buffers", display_name = "Buffers" },
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            local map = vim.keymap.set
            local opts = { buffer = true, noremap = true, silent = true }
            -- Filesystem
            map("n", "gf", function()
              require("neo-tree.command").execute({ source = "filesystem" })
            end, opts)
            -- Git status
            map("n", "gg", function()
              require("neo-tree.command").execute({ source = "git_status" })
            end, opts)
            -- Buffers
            map("n", "gb", function()
              require("neo-tree.command").execute({ source = "buffers" })
            end, opts)
          end,
        },
      },
    },
  },

  -- Melhor busca e replace visual
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files (Ctrl+P like VS Code)" },
      { "<C-f>", "<cmd>Telescope live_grep<cr>", desc = "Find in files" },
      { "<C-h>", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    },
  },

  -- Comentar código facilmente
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Flutter Tools (Suporte para Flutter/Dart)
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = "dart",
    opts = {},
  },

  -- C# / .NET Support
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    ft = "cs",
  },

  -- Terminal flutuante
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<A-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" },
    },
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "float" then
            return { height = 30, width = 120 }
          end
        end,
        direction = "float",
        float_opts = {
          border = "curved",
        },
      })
      
      -- Comando para sair do terminal facilmente
      vim.keymap.set("t", "<A-t>", "<C-\\><C-n><cmd>ToggleTerm<cr>", { noremap = true, silent = true })
    end,
  },

  -- GitHub Copilot configuration
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = false,
          ["."] = false,
        },
      })
    end,
  },

  -- GitHub Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
      model = 'claude-haiku-4.5',
      window = {
        layout = 'vertical',
        width = 0.4,
      },
      show_help = false,
      show_system_prompt = false,
      -- Modo agente - permite que o Copilot execute ações autonomamente
      agent = 'o200-1217',  -- Modelo com capacidades de agente
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
      { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "Generate tests" },
      { "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Fix code" },
      { "<leader>co", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize code" },
      { "<leader>cm", "<cmd>CopilotChatModels<cr>", desc = "Select Copilot Model" },
      { "<leader>ca", "<cmd>CopilotChatAgents<cr>", desc = "Select Copilot Agent" },
      { "<leader>cr", "<cmd>CopilotChatReset<cr>", desc = "Reset Chat" },
      { "<leader>cs", "<cmd>CopilotChatStop<cr>", desc = "Stop Chat" },
    },
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  -- Quick save with Ctrl+s e outros atalhos básicos
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<C-s>"] = { "<cmd>w<cr>", desc = "Save file" },
        },
        i = {
          ["<C-s>"] = { "<esc><cmd>w<cr>", desc = "Save and exit insert" },
        },
      },
    },
  },

  -- UI mais bonita para popups, seletores e inputs
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Guias de indentação visuais
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope = { enabled = true },
    },
  },
}
