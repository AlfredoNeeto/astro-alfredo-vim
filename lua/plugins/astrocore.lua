-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- Autocmds para ajustar formatação por tipo de arquivo
    autocmds = {
      csharp_settings = {
        {
          event = "FileType",
          pattern = "cs",
          desc = "Configurações específicas para C#",
          callback = function()
            vim.opt_local.tabstop = 4
            vim.opt_local.shiftwidth = 4
            vim.opt_local.softtabstop = 4
            vim.opt_local.expandtab = true
            vim.opt_local.textwidth = 0
            vim.opt_local.formatoptions = "jcroql"
          end,
        },
      },
      javascript_typescript_settings = {
        {
          event = "FileType",
          pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
          desc = "Configurações para JS/TS",
          callback = function()
            vim.opt_local.tabstop = 2
            vim.opt_local.shiftwidth = 2
            vim.opt_local.softtabstop = 2
            vim.opt_local.expandtab = true
          end,
        },
      },
      dart_settings = {
        {
          event = "FileType",
          pattern = "dart",
          desc = "Configurações para Dart/Flutter",
          callback = function()
            vim.opt_local.tabstop = 2
            vim.opt_local.shiftwidth = 2
            vim.opt_local.softtabstop = 2
            vim.opt_local.expandtab = true
          end,
        },
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        cursorline = true, -- destaca a linha atual
        termguicolors = true, -- cores verdadeiras
        scrolloff = 8, -- linhas de contexto ao rolar
        sidescrolloff = 8, -- colunas de contexto ao rolar
        mouse = "a", -- habilita mouse em todos os modos
        clipboard = "unnamedplus", -- usa clipboard do sistema
        splitbelow = true, -- split horizontal para baixo
        splitright = true, -- split vertical para direita
        conceallevel = 0, -- mostra todos os caracteres
        pumheight = 15, -- altura do popup de completação
        -- Configurações de indentação e formatação
        tabstop = 4, -- tamanho do tab visual
        shiftwidth = 4, -- tamanho da indentação
        softtabstop = 4, -- tamanho do tab ao editar
        expandtab = true, -- usa espaços ao invés de tabs
        smartindent = true, -- indentação inteligente
        autoindent = true, -- mantém indentação da linha anterior
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
