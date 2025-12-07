return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vscode").setup({
      style = "dark",
      transparent = false,
      italic_comments = false,
      underline_links = true,
      disable_nvimtree_bg = true,
    })
    require("vscode").load()
  end,
}
