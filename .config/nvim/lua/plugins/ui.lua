return {
  -- Local solarized colorscheme
  {
    dir = "~/.dotfiles/.config/nvim/pack/local/start/solarized",
    name = "solarized-custom",
    priority = 1000,
    lazy = false,
    config = function()
      -- Force term colors
      vim.opt.termguicolors = false
      vim.g.solarized_use_gui = 0
      -- Set background based on iTerm profile
      vim.opt.background = vim.env.ITERM_PROFILE:match("light") and "light" or "dark"
      vim.cmd.colorscheme("solarized")
    end,
  },

  -- File Explorer
  {
    "preservim/nerdtree",
    keys = {
      { "<Leader>d", ":NERDTreeToggle<CR>:redraw!<CR>", desc = "Toggle NERDTree" },
      { "<Leader>f", ":NERDTreeFind<CR>:redraw!<CR>", desc = "Find in NERDTree" },
    },
    config = function()
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeAutoDeleteBuffer = 1
      vim.g.NERDTreeMinimalUI = 1
      vim.g.NERDTreeIgnore = {
        "\\.pyc$",
        "\\.pyo$",
        "^__pycache__$[[dir]]",
      }
      vim.g.NERDTreeWinSize = 40
      vim.g.NERDTreeDirArrows = 1
      vim.g.NERDTreeDirArrowExpandable = "▸"
      vim.g.NERDTreeDirArrowCollapsible = "▾"
    end,
  },

  -- Status Line
  {
    "vim-airline/vim-airline",
    dependencies = { "vim-airline/vim-airline-themes" },
    config = function()
      vim.g.airline_powerline_fonts = 1
      vim.g.airline_theme = "solarized"
      vim.g["airline_extensions_whitespace_enabled"] = 0
      vim.g["airline_extensions_whitespace_mixed_indent_algo"] = 2
      vim.g["airline_extensions_whitespace_checks"] =
        { "indent", "trailing", "mixed-indent-file" }

      -- Airline symbols
      if vim.fn.exists("g:airline_symbols") == 0 then
        vim.g.airline_symbols = {}
      end
      vim.g["airline_left_sep"] = "⮀"
      vim.g["airline_left_alt_sep"] = "⮁"
      vim.g["airline_right_sep"] = "⮂"
      vim.g["airline_right_alt_sep"] = "⮃"
      vim.g["airline_symbols"]["branch"] = "⭠  "
      vim.g["airline_symbols"]["readonly"] = "⭤"
      vim.g["airline_symbols"]["linenr"] = "⭡"
      vim.g["airline_symbols"]["maxlinenr"] = "☰ "
      vim.g["airline_symbols"]["dirty"] = "*"
      vim.g["airline_symbols"]["whitespace"] = "Ξ"
      vim.g["airline_symbols"]["colnr"] = " ℅:"
    end,
  },

  -- Comments
  {
    "preservim/nerdcommenter",
    config = function()
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDTrimTrailingWhitespace = 1
    end,
  },
}
