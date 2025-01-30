return {
  -- LSP and completion
  {
    "neoclide/coc.nvim",
    branch = "release",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Basic CoC settings
      vim.g.coc_global_extensions = {
        "coc-json",
        "coc-git",
        "coc-pyright",
        "coc-tsserver",
      }
    end,
  },

  -- AI assistance
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },

  -- Snippets
  {
    "SirVer/ultisnips",
    ft = { "javascript", "php", "python", "snippets" },
    config = function()
      vim.g.UltiSnipsListSnippets = "<C-l>"
      vim.g.UltiSnipsSnippetDirectories =
        { vim.fn.expand("$HOME") .. "/.vim/my-snippets/UltiSnips" }
      vim.g.UltiSnipsEditSplit = "context"
      vim.g.UltiSnipsJumpBackwardTrigger = "<C-b>"
    end,
  },
}
