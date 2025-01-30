return {
  -- Git commands
  {
    "tpope/vim-fugitive",
    keys = {
      { "<Leader>gb", ":Git blame<CR>", desc = "Git blame" },
      { "<Leader>gs", ":Git<CR>", desc = "Git status" },
      { "<Leader>gc", ":Git commit -v<CR>", desc = "Git commit" },
    },
    config = function()
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "fugitive://*",
        command = "set bufhidden=delete",
      })
    end,
  },

  -- Git signs in the gutter
  {
    "airblade/vim-gitgutter",
    event = { "BufReadPre", "BufNewFile" },
  },
}
