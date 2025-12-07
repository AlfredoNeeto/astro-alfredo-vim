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
      popup_border_style = "rounded",
      window = { 
        width = 32,
        mappings = {
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        git_status = {
          symbols = {
            added = "✓",
            modified = "●",
            deleted = "✗",
            renamed = "➤",
            untracked = "★",
            ignored = "○",
            unstaged = "○",
            staged = "●",
            conflict = "⚠",
          },
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        use_libuv_file_watcher = true,
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
    opts = function(_, opts)
      local actions = require "telescope.actions"
      return require("astrocore").extend_tbl(opts, {
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = "▶ ",
          path_display = { "smart" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
      })
    end,
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

  -- C# / .NET Support com Roslyn
  {
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = {
      config = {
        settings = {
          ["csharp|formatting"] = {
            organize_imports = true,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
          },
        },
      },
    },
  },

  -- Emmet para HTML/CSS (autocompletar tags)
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation, { desc = "Emmet wrap" })
    end,
  },

  -- Autoclose e autorename de tags HTML
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },

  -- Highlight de cores CSS
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = {
        css = true,
        css_fn = true,
        tailwind = true,
      },
    },
  },

  -- Live Server para desenvolvimento web com hot-reload
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },

  -- Formatadores para diversos tipos de arquivo
  {
    "stevearc/conform.nvim",
    event = "BufReadPre",
    opts = {
      formatters_by_ft = {
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        xml = { "xmlformat" },
        -- XAML usa o mesmo formatador que XML
        xaml = { "xmlformat" },
      },
      format_on_save = function(bufnr)
        -- Formatar automaticamente ao salvar
        return {
          timeout_ms = 3000,
          lsp_fallback = true,
        }
      end,
    },
  },

  -- Desabilitar conform.nvim temporariamente
  --[[ 
  -- Formatador melhor para C# e outras linguagens
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "black" },
        dart = { "dart_format" },
      },
      format_on_save = function(bufnr)
        -- Desabilitar auto-format, usar manual
        return nil
      end,
      formatters = {
        csharpier = {
          command = "dotnet",
          args = function(self, ctx)
            return {
              "csharpier",
              "--write-stdout",
            }
          end,
          stdin = true,
        },
      },
    },
  },
  ]]--

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
      -- Prompt padrão para todas as conversas
      system_prompt = [[
Você é um assistente de programação ajudando um desenvolvedor brasileiro.
Regras importantes:
- Sempre responda em português do Brasil.
- Seja objetivo e direto, sem texto desnecessário.
- Sempre que fizer sentido, mostre exemplos de código.
- Nunca traduza código, nomes de classes, métodos, variáveis ou APIs.
- Explique em português, mas deixe o código exatamente como estaria em um projeto real em inglês.
- Quando listar passos, seja curto (no máximo 3–5 itens).
- Se a pergunta estiver confusa, peça esclarecimento de forma simples.
]],
    },
    keys = function(_, keys)
      -- mantém qualquer mapeamento padrão do plugin
      local mappings = {
        { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
        -- Explicar código (usa seleção visual se existir)
        { "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "Explain code / selection" },
        { "<leader>ct", "<cmd>CopilotChatTests<cr>", mode = { "n", "v" }, desc = "Generate tests" },
        { "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }, desc = "Fix code" },
        { "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = { "n", "v" }, desc = "Optimize code" },
        { "<leader>cm", "<cmd>CopilotChatModels<cr>", desc = "Select Copilot Model" },
        { "<leader>cr", "<cmd>CopilotChatReset<cr>", desc = "Reset Chat" },
        { "<leader>cs", "<cmd>CopilotChatStop<cr>", desc = "Stop Chat" },
      }
      return vim.list_extend(keys or {}, mappings)
    end,
  },

  -- Quick save com Ctrl+s e formatação inteligente
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<C-s>"] = { "<cmd>w<cr>", desc = "Save file" },
          ["<leader>l"] = {
            function()
              local ft = vim.bo.filetype
              local conform_fts = { "json", "jsonc", "yaml", "markdown", "html", "css", "scss", 
                                    "javascript", "typescript", "javascriptreact", "typescriptreact", 
                                    "vue", "xml", "xaml" }
              
              -- Verificar se é um tipo de arquivo que o conform suporta
              local use_conform = false
              for _, conform_ft in ipairs(conform_fts) do
                if ft == conform_ft then
                  use_conform = true
                  break
                end
              end

              if use_conform then
                require("conform").format({
                  async = false,
                  timeout_ms = 3000,
                  lsp_fallback = true,
                })
              else
                vim.lsp.buf.format({
                  async = false,
                  timeout_ms = 5000,
                })
              end
            end,
            desc = "Format file"
          },
          -- Abrir HTML no navegador
          ["<leader>ho"] = {
            function()
              local file = vim.fn.expand("%:p")
              if vim.bo.filetype == "html" then
                vim.fn.jobstart({ "cmd.exe", "/c", "start", file }, { detach = true })
              else
                vim.notify("Não é um arquivo HTML", vim.log.levels.WARN)
              end
            end,
            desc = "Open HTML in browser"
          },
          -- Live Server
          ["<leader>hs"] = { "<cmd>LiveServerStart<cr>", desc = "Start Live Server" },
          ["<leader>hq"] = { "<cmd>LiveServerStop<cr>", desc = "Stop Live Server" },
        },
        i = {
          ["<C-s>"] = { "<esc><cmd>w<cr>", desc = "Save and exit insert" },
        },
        v = {
          ["<leader>l"] = {
            function()
              vim.lsp.buf.format({
                async = false,
                timeout_ms = 5000,
              })
            end,
            desc = "Format selection"
          },
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

}

