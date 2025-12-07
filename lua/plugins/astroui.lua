-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "github_dark_default",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Melhorar contraste e suavidade da UI
        CursorLine = { bg = "#1c2128" },
        StatusLine = { bg = "#161b22", fg = "#c9d1d9" },
        TabLine = { bg = "#0d1117" },
        TabLineFill = { bg = "#0d1117" },
        WinSeparator = { fg = "#30363d" },
        -- Popup e floating windows mais bonitos
        NormalFloat = { bg = "#161b22" },
        FloatBorder = { fg = "#58a6ff", bg = "#161b22" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
