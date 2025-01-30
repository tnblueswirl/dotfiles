return {
  -- Tim Pope's essential plugins
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    "tpope/vim-unimpaired",
    event = "VeryLazy",
  },
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "tpope/vim-obsession",
    lazy = false,
    cmd = { "Obsession" },
  },

  -- EditorConfig support
  {
    "editorconfig/editorconfig-vim",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Syntax range
  {
    "inkarkat/vim-ingo-library",
    lazy = false,
  },
  {
    "inkarkat/vim-SyntaxRange",
    dependencies = { "inkarkat/vim-ingo-library" },
    lazy = false,
    config = function()
      -- Explicitly source the required files
      vim.cmd(
        "source "
          .. vim.fn.stdpath("data")
          .. "/lazy/vim-SyntaxRange/plugin/SyntaxRange.vim"
      )
      vim.cmd(
        "source "
          .. vim.fn.stdpath("data")
          .. "/lazy/vim-SyntaxRange/autoload/SyntaxRange.vim"
      )

      -- Set up XML syntax highlighting for SQL tags
      vim.api.nvim_create_autocmd("Syntax", {
        pattern = "xml",
        command = [[ call SyntaxRange#Include('<Sql>', '</Sql>', 'sql', 'xmlTagName')]]
      })

      -- Automatically syntax highlight diffs and code blocks
      vim.api.nvim_create_autocmd("Syntax", {
        pattern = "*",
        callback = function()
          vim.cmd([[
            call SyntaxRange#Include('<<<<<<<', '>>>>>>>', 'diff', 'Special')
          ]])
        end,
      })
    end,
  },

  -- Code formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>gq",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        markdown = { "prettier" },
      },
    },
  },
}
