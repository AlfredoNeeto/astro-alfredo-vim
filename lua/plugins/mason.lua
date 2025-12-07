---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- Language Servers
        "lua-language-server",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "emmet-ls",
        
        -- Formatters
        "stylua",
        "prettier",

        -- Debuggers
        "debugpy",
      },
    },
  },
}
