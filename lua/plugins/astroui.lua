-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
local palette = {
  base = "#1e1e1e",
  gutter = "#1e1e1e",
  panel = "#252526",
  panel_alt = "#2d2d30",
  text = "#dcdcdc",
  muted = "#c8c8c8",
  subtle = "#808080",
  dim = "#3f3f46",
  border = "#3f3f46",
  accent = "#68217a",
  accent_light = "#a371f7",
  accent_soft = "#b6a0ff",
  selection = "#264f78",
  search_bg = "#613214",
  search_fg = "#f9f1a5",
  comment = "#57a64a",
  keyword = "#569cd6",
  string = "#d69d85",
  number = "#b5cea8",
  constant = "#4fc1ff",
  func = "#dcdcaa",
  variable = "#9cdcfe",
  type = "#4ec9b0",
  builtin = "#c586c0",
  success = "#6a9955",
  success_soft = "#b5cea8",
  warning = "#cca700",
  danger = "#f44747",
  info = "#3794ff",
  hint = "#b5cea8",
  orange = "#d69d85",
  magenta = "#c586c0",
  teal = "#4ec9b0",
  cyan = "#9cdcfe",
}

return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "vscode",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Base surfaces e leitura
        Normal = { fg = palette.text, bg = palette.gutter },
        NormalNC = { fg = palette.muted, bg = palette.gutter },
        NormalSB = { fg = palette.muted, bg = palette.panel },
        NonText = { fg = palette.dim },
        SignColumn = { bg = palette.gutter },
        LineNr = { fg = palette.dim, bg = palette.gutter },
        CursorLine = { bg = palette.panel_alt },
        CursorLineNr = { fg = palette.accent_light, bg = palette.panel_alt, bold = true },
        FoldColumn = { fg = palette.dim, bg = palette.gutter },
        ColorColumn = { bg = palette.panel },
        WinSeparator = { fg = palette.border },
        WinSeparatorNC = { fg = palette.border },
        FloatBorder = { fg = palette.accent_light, bg = palette.panel },
        FloatTitle = { fg = palette.base, bg = palette.accent_light, bold = true },
        NormalFloat = { fg = palette.text, bg = palette.panel },

        -- Status/tab chrome
        StatusLine = { fg = palette.text, bg = palette.panel_alt, bold = true },
        StatusLineNC = { fg = palette.subtle, bg = palette.panel },
        WinBar = { fg = palette.text, bg = palette.gutter, bold = true },
        WinBarNC = { fg = palette.subtle, bg = palette.gutter },
        TabLine = { fg = palette.dim, bg = palette.base },
        TabLineFill = { bg = palette.base },
        TabLineSel = { fg = palette.base, bg = palette.accent, bold = true },

        -- Seleções e busca
        Visual = { bg = palette.selection, fg = palette.text },
        Search = { bg = palette.search_bg, fg = palette.search_fg, bold = true },
        IncSearch = { bg = palette.accent, fg = palette.text, bold = true },
        QuickFixLine = { bg = "#2f3248" },
        MatchParen = { fg = palette.text, bg = palette.accent_light, bold = true },

        -- Menus e popups
        Pmenu = { fg = palette.text, bg = palette.panel },
        PmenuSel = { fg = palette.base, bg = palette.accent },
        PmenuSbar = { bg = palette.panel },
        PmenuThumb = { bg = palette.accent_soft },
        NoiceCmdlinePopup = { fg = palette.text, bg = palette.panel_alt },
        NoiceCmdlinePopupBorder = { fg = palette.accent_light, bg = palette.panel_alt },
        NoicePopupmenu = { fg = palette.text, bg = palette.panel },
        NoicePopupmenuBorder = { fg = palette.accent_light, bg = palette.panel },

        -- Sintaxe mais viva
        Comment = { fg = palette.comment },
        Keyword = { fg = palette.keyword, bold = true },
        Statement = { fg = palette.keyword, bold = true },
        Conditional = { fg = palette.keyword, bold = true },
        Repeat = { fg = palette.keyword, bold = true },
        Exception = { fg = palette.keyword, bold = true },
        PreProc = { fg = palette.builtin },
        Include = { fg = palette.builtin },
        Define = { fg = palette.builtin },
        Macro = { fg = palette.builtin },
        Function = { fg = palette.func },
        Identifier = { fg = palette.variable },
        Field = { fg = palette.variable },
        Property = { fg = palette.variable },
        Operator = { fg = palette.text },
        String = { fg = palette.string },
        Character = { fg = palette.string },
        Number = { fg = palette.number },
        Boolean = { fg = palette.number },
        Constant = { fg = palette.constant },
        Type = { fg = palette.teal, bold = true },
        Structure = { fg = palette.teal, bold = true },
        StorageClass = { fg = palette.teal },
        Typedef = { fg = palette.teal, bold = true },
        ["@type"] = { fg = palette.teal, bold = true },
        ["@type.definition"] = { fg = palette.teal, bold = true },
        ["@type.builtin"] = { fg = palette.builtin, italic = true },
        ["@namespace"] = { fg = palette.variable },
        ["@property"] = { fg = palette.variable },
        ["@parameter"] = { fg = palette.variable },

        -- Diagnósticos destacados
        DiagnosticError = { fg = palette.danger, bold = true },
        DiagnosticWarn = { fg = palette.warning, bold = true },
        DiagnosticInfo = { fg = palette.info, bold = true },
        DiagnosticHint = { fg = palette.hint, bold = true },
        DiagnosticVirtualTextError = { fg = palette.danger, bg = "#3a1e28" },
        DiagnosticVirtualTextWarn = { fg = palette.warning, bg = "#3a341e" },
        DiagnosticVirtualTextInfo = { fg = palette.info, bg = "#1f2d3f" },
        DiagnosticVirtualTextHint = { fg = palette.hint, bg = "#24352a" },
        DiagnosticUnderlineError = { sp = palette.danger, undercurl = true },
        DiagnosticUnderlineWarn = { sp = palette.warning, undercurl = true },
        DiagnosticUnderlineInfo = { sp = palette.info, undercurl = true },
        DiagnosticUnderlineHint = { sp = palette.hint, undercurl = true },

        -- Git signs e diffs
        GitSignsAdd = { fg = palette.success },
        GitSignsChange = { fg = palette.keyword },
        GitSignsDelete = { fg = palette.orange },
        DiffAdd = { fg = palette.success, bg = "#1f331f" },
        DiffChange = { fg = palette.keyword, bg = "#1f2f47" },
        DiffDelete = { fg = palette.orange, bg = "#3e1f23" },
        DiffText = { fg = palette.keyword, bg = "#2c3f5a" },

        -- Telescope totalmente custom
        TelescopeNormal = { fg = palette.text, bg = palette.panel },
        TelescopeBorder = { fg = palette.accent_light, bg = palette.panel },
        TelescopePromptNormal = { fg = palette.text, bg = palette.panel_alt },
        TelescopePromptBorder = { fg = palette.accent, bg = palette.panel_alt },
        TelescopePromptTitle = { fg = palette.base, bg = palette.accent, bold = true },
        TelescopePreviewTitle = { fg = palette.base, bg = palette.success, bold = true },
        TelescopeResultsTitle = { fg = palette.base, bg = palette.accent_light, bold = true },
        TelescopeSelection = { fg = palette.text, bg = palette.selection },
        TelescopeMatching = { fg = palette.keyword, bold = true },

        -- Completion
        CmpItemMenu = { fg = palette.dim },
        CmpItemAbbr = { fg = palette.text },
        CmpItemAbbrMatch = { fg = palette.keyword, bold = true },
        CmpItemKindFunction = { fg = palette.func },
        CmpItemKindVariable = { fg = palette.variable },
        CmpItemKindField = { fg = palette.constant },
        CmpItemKindKeyword = { fg = palette.keyword },

        -- LSP context
        LspReferenceText = { bg = "#2a2d40" },
        LspReferenceRead = { bg = "#2a2d40" },
        LspReferenceWrite = { bg = "#3a2d40" },

        -- Treesitter context e extras
        TreesitterContext = { bg = "#2a2d38" },
        TreesitterContextLineNumber = { fg = palette.keyword },

        -- Copilot Chat Styles - Purple Theme (Texto Roxo)
        CopilotChatHeader = { fg = "#a371f7", bold = true }, -- Apenas texto roxo para o cabeçalho
        CopilotChatSeparator = { fg = "#3e3e42" }, -- Separador cinza escuro
        CopilotChatPrompt = { fg = "#a371f7", bold = true }, -- Roxo claro para o prompt
        CopilotChatModel = { fg = "#9cdcfe", italic = true }, -- Azul claro
        CopilotChatResource = { fg = "#ce9178" }, -- Laranja
        CopilotChatStatus = { fg = "#808080", italic = true }, -- Cinza sutil e itálico
        CopilotChatTool = { fg = "#4ec9b0", bold = true }, -- Verde água
        CopilotChatAnnotation = { fg = "#6a9955" }, -- Verde comentário
        CopilotChatSpinner = { fg = "#a371f7" }, -- Spinner Roxo
        CopilotChatCode = { fg = "#d4d4d4" }, -- Texto claro
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
