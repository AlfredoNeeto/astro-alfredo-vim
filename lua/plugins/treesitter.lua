-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua", "vim", "c", "cpp", "c_sharp", "python", "javascript", "typescript",
      "html", "css", "scss", "json", "yaml", "bash", "markdown", "markdown_inline",
      "rust", "go", "java", "ruby", "php", "swift", "kotlin", "r", "sql", "toml",
      "xml", "dockerfile", "vue", "proto", "elixir", "haskell", "perl", "scala",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
