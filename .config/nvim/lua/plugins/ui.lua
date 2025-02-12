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
      {
        "<Leader>d",
        ":NERDTreeToggle<CR>:redraw!<CR>",
        desc = "Toggle NERDTree",
        silent = true,
      },
      {
        "<Leader>f",
        ":NERDTreeFind<CR>:redraw!<CR>",
        desc = "Find in NERDTree",
        silent = true,
      },
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
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      local function obsession_on()
        if vim.g.this_obsession then
          return "$"
        else
          return ""
        end
      end
      local custom_solarized = require("plugins.solarized-lualine")
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = custom_solarized,
          component_separators = { left = "⮁", right = "⮃" },
          section_separators = { left = "⮀  ", right = "⮂" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = { "fugitiveblame", "fzf", "help" },
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "branch", icon = "⭠" },
            {
              "diff",
              colored = true,
              diff_color = {
                added = { fg = 15 },
                modified = { fg = 15 },
                removed = { fg = 15 },
              },
            },
            {
              "diagnostics",
              sources = { "coc", "ale" },
              diagnostics_color = {
                error = { fg = 124 },
                warning = { fg = 3 },
                info = { fg = 4 },
                hint = { fg = 6 },
              },
              symbols = { error = "E", warn = "W", info = "ℹ", hint = "⚑" },
            },
          },
          lualine_c = { { "filename", symbols = { readonly = "⭤" } } },
          lualine_x = {
            "encoding",
            { obsession_on },
            { "filetype", icons_enabled = false },
          },
          lualine_y = { "progress" },
          lualine_z = { "location", "searchcount", "selectioncount" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", symbols = { readonly = "⭤" } } },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { "fugitive", "fzf", "lazy", "man", "nerdtree" },
      })
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
