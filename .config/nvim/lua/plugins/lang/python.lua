return {
  -- Enhanced Python syntax
  {
    "vim-python/python-syntax",
    ft = "python",
    config = function()
      vim.g.python_highlight_all = 1
      vim.g.python_highlight_func_calls = 1
      vim.g.python_highlight_class_vars = 1
    end,
  },

  -- Python indentation
  {
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
  },

  -- python textwidth support
  {
    "jimf/vim-pep8-text-width",
    ft = "python",
  },
}
