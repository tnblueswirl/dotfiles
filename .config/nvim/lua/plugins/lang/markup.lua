return {
  -- Markdown support
  {
    "preservim/vim-markdown",
    ft = "markdown",
    dependencies = { "godlygeek/tabular" },
    config = function()
      -- Existing settings
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.vim_markdown_new_list_item_indent = 2
      vim.g.vim_markdown_auto_insert_bullets = 1

      -- Fence settings
      vim.g.vim_markdown_fenced_languages = {
        "html",
        "python",
        "bash=sh",
        "sql",
        "javascript",
        "js=javascript",
        "json=javascript",
        "php",
      }
    end,
  },

  -- XML/HTML tag matching
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
}
