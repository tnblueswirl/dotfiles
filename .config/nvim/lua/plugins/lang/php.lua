return {
  -- PHP syntax and indentation
  {
    "StanAngeloff/php.vim",
    ft = "php",
    config = function()
      -- PHP syntax override function
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "php",
        callback = function()
          vim.cmd("hi! def link phpDocTags phpDefine")
          vim.cmd("hi! def link phpDocParam phpType")
        end,
      })
    end,
  },

  -- phpfolding for automatically creating folds in PHP code
  {
    "rayburgemeestre/phpfolding.vim",
    ft = "php",
  },

  -- PHP blade syntax highlighting
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },
}
