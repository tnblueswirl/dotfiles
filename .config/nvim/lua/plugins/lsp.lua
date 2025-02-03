return {
  -- LSP and completion
  {
    "neoclide/coc.nvim",
    branch = "release",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Basic CoC settings
      vim.g.coc_global_extensions = {
        "coc-css",
        "coc-go",
        "coc-html",
        "coc-json",
        "coc-phpls",
        "coc-pyright",
        "coc-sh",
        "coc-tsserver",
      }
    end,
  },

  -- AI assistance
  {
    "github/copilot.vim",
    event = "InsertEnter",
    lazy = false,
    config = function()
      -- Remap <C-J> to accept Copilot suggestion
      vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
        silent = true,
        expr = true,
        script = true,
        replace_keycodes = false,
      })
      vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)")
      vim.keymap.set("i", "<C-F>", "<Plug>(copilot-next)")
      vim.keymap.set("i", "<C-B>", "<Plug>(copilot-previous)")

      -- Disable tab mapping
      vim.g.copilot_no_tab_map = true

      -- Disable for specific filetypes
      vim.g.copilot_filetypes = {
        markdown = false,
      }
    end,
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
