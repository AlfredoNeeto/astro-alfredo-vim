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

  -- Terminal flutuante com SSH integrado
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    priority = 100,
    keys = {
      { "<A-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" },
      { "<leader>sh", desc = "SSH: Selecionar host" },
    },
    config = function()
      local toggleterm = require("toggleterm")
      toggleterm.setup({
        size = function(term)
          if term.direction == "float" then
            return { height = 25, width = 100 }
          end
        end,
        direction = "float",
        float_opts = {
          border = "rounded",
          winblend = 0,
        },
        shade_terminals = false,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        auto_scroll = true,
      })

      local Terminal = require("toggleterm.terminal").Terminal
      local ssh_terminals = {}

      -- Comando para sair do terminal facilmente
      vim.keymap.set("t", "<A-t>", "<C-\\><C-n><cmd>ToggleTerm<cr>", { noremap = true, silent = true })

      local function read_ssh_config()
        local hosts = {}
        local function consume_file(path)
          if vim.fn.filereadable(path) == 0 then
            return
          end
          for _, line in ipairs(vim.fn.readfile(path)) do
            local host_line = line:match("^%s*[Hh]ost%s+(.+)")
            if host_line then
              for token in host_line:gmatch("%S+") do
                if not token:find("%*") then
                  hosts[token] = token
                end
              end
            end
          end
        end

        consume_file(vim.fn.expand("~/.ssh/config"))

        local config_dir = vim.fn.expand("~/.ssh/config.d")
        if vim.fn.isdirectory(config_dir) == 1 then
          local files = vim.fn.globpath(config_dir, "*", false, true)
          for _, file in ipairs(files) do
            consume_file(file)
          end
        end

        return hosts
      end

      local function manual_hosts()
        local map = {}
        local manual = vim.g.neovim_ssh_hosts or vim.g.ssh_hosts
        if type(manual) ~= "table" then
          return map
        end
        for alias, value in pairs(manual) do
          local key = alias
          local target = value
          if type(alias) == "number" then
            key = tostring(value)
            target = value
          end
          if type(target) == "string" then
            map[tostring(key)] = target
          end
        end
        return map
      end

      local function collect_hosts()
        local hosts = manual_hosts()
        for alias, target in pairs(read_ssh_config()) do
          if hosts[alias] == nil then
            hosts[alias] = target
          end
        end
        return hosts
      end

      local function sorted_hosts()
        local items = {}
        for alias, target in pairs(collect_hosts()) do
          table.insert(items, { alias = alias, target = target })
        end
        table.sort(items, function(a, b)
          return a.alias < b.alias
        end)
        return items
      end

      local function open_ssh(target, alias)
        if not target or target == "" then
          vim.notify("Host SSH inválido", vim.log.levels.WARN)
          return
        end

        alias = alias or target
        local key = alias .. "::" .. target
        if not ssh_terminals[key] then
          local cmd = target
          if not cmd:match("^%s*ssh%s") then
            cmd = "ssh " .. cmd
          end
          ssh_terminals[key] = Terminal:new({
            cmd = cmd,
            direction = "float",
            close_on_exit = false,
            hidden = true,
            float_opts = {
              border = "rounded",
              winblend = 0,
            },
            on_open = function(term)
              vim.cmd.startinsert()
              pcall(vim.api.nvim_buf_set_name, term.bufnr, ("SSH: %s"):format(alias))
              -- Mapear Esc para fechar o terminal SSH
              vim.keymap.set("t", "<Esc>", function()
                term:close()
              end, { buffer = term.bufnr, noremap = true, silent = true })
            end,
          })
        end

        ssh_terminals[key]:toggle()
      end

      local function interactive_ssh()
        local hosts = sorted_hosts()
        if vim.tbl_isempty(hosts) then
          vim.ui.input({ prompt = "Host SSH (ex: usuario@servidor)", completion = "file" }, function(input)
            if input and input ~= "" then
              open_ssh(vim.trim(input), vim.trim(input))
            end
          end)
          return
        end

        vim.ui.select(hosts, {
          prompt = "🌐 Conectar via SSH",
          format_item = function(item)
            if item.alias == item.target then
              return string.format("  %s", item.alias)
            end
            return string.format("  %s  →  %s", item.alias, item.target)
          end,
        }, function(choice)
          if not choice then
            return
          end
          open_ssh(choice.target, choice.alias)
        end)
      end

      vim.api.nvim_create_user_command("SSH", function(opts)
        local arg = vim.trim(opts.args or "")
        if arg ~= "" then
          local hosts = collect_hosts()
          local target = hosts[arg] or arg
          open_ssh(target, arg)
        else
          interactive_ssh()
        end
      end, {
        desc = "Abrir conexão SSH em terminal flutuante",
        nargs = "?",
        complete = function()
          local names = {}
          for _, item in ipairs(sorted_hosts()) do
            table.insert(names, item.alias)
          end
          return names
        end,
      })

      vim.keymap.set("n", "<leader>sh", interactive_ssh, { desc = "Selecionar host SSH", silent = true })
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
        layout = 'float',
        relative = 'editor',
        width = 0.8,
        height = 0.8,
        border = 'rounded',
        title = '   Copilot Chat ',
        title_pos = 'center',
        footer = ' C-l: Aceitar | M-]: Próx | M-[: Ant | Esc: Fechar ',
      },
      headers = {
        user = ' Você',
        assistant = ' Copilot',
        tool = ' Ferramenta',
      },
      separator = '────────────────────────',
      auto_insert_mode = true,
      show_help = false,
      show_system_prompt = false,
      -- Prompt padrão para todas as conversas
      system_prompt = [[
Você é um assistente de programação experiente ajudando um desenvolvedor brasileiro.

REGRAS DE FORMATAÇÃO DE CÓDIGO (CRÍTICO):
- SEMPRE use blocos de código cercados com três crases (```)
- SEMPRE especifique a linguagem após as três crases de abertura
- Use os nomes exatos: csharp, cpp, python, javascript, typescript, html, css, bash, json, yaml, rust, go, java, ruby, php, lua, sql, etc.
- Para C#, use: ```csharp
- Para C++, use: ```cpp
- NUNCA use formato "[linguagem] block" - isso NÃO funciona
- Sempre feche o bloco com três crases em linha separada

FORMATO CORRETO:
```csharp
using System;
class Program { }
```

REGRAS DE CONTEÚDO:
- Responda sempre em português do Brasil
- Seja objetivo e direto
- Mantenha código em inglês (nomes de variáveis, classes, métodos)
- Explique em português, mas preserve APIs e termos técnicos em inglês
- Liste no máximo 3-5 passos quando necessário
- Peça esclarecimento se a pergunta for confusa

IMPORTANTE: A formatação correta do código é essencial para syntax highlighting funcionar.
]],
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)

      -- Register markdown parser for copilot-chat filetype (fallback)
      pcall(vim.treesitter.language.register, "markdown", "copilot-chat")

      -- Limpar configurações antigas de fenced languages para evitar erros de syntax
      vim.g.markdown_fenced_languages = nil

      -- Aliases extras para o Treesitter reconhecer nomes customizados em blocos markdown
      local fenced_aliases = {
        csharp = "c_sharp",
        cs = "c_sharp",
        javascriptreact = "tsx",
        typescriptreact = "tsx",
      }
      for alias, parser in pairs(fenced_aliases) do
        pcall(vim.treesitter.language.register, parser, alias)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "copilot-chat",
        callback = function(event)
          -- Force markdown filetype to ensure all standard markdown tooling (syntax, treesitter) works
          local buf = event.buf
          vim.schedule(function()
            if not vim.api.nvim_buf_is_valid(buf) then
              return
            end

            vim.api.nvim_buf_set_option(buf, "filetype", "markdown")

            vim.api.nvim_buf_call(buf, function()
              vim.opt_local.relativenumber = false
              vim.opt_local.number = false
              vim.opt_local.conceallevel = 2
              vim.opt_local.concealcursor = ""
            end)
          end)
        end,
      })
    end,
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


