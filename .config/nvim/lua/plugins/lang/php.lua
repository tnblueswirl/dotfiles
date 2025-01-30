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

  -- PHP documentation
  {
    "tobyS/pdv",
    ft = "php",
    dependencies = { "tobyS/vmustache" },
    config = function()
      vim.g.pdv_template_dir = vim.fn.expand("~/.vim/plugged/pdv/templates_snip")
    end,
  },
}
