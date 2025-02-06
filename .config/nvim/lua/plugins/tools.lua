return {
  -- Fuzzy Finding
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    keys = {
      { "<Leader>b", ":Buffers<CR>", desc = "FZF Buffers" },
      { "<Leader>t", ":Files<CR>", desc = "FZF Files" },
      { "<Leader>T", ":Tags<CR>", desc = "FZF Tags" },
    },
    config = function()
      vim.g.fzf_buffers_jump = 1

      -- Configure layout based on terminal capabilities
      if vim.fn.has("popupwin") == 1 then
        vim.g.fzf_layout = {
          window = {
            width = 0.9,
            height = 0.6,
          },
        }
      end

      -- Set up preview with bat if available
      if vim.fn.executable("bat") == 1 then
        vim.env.BAT_THEME = "1337"
        vim.env.FZF_DEFAULT_COMMAND =
          'ag -U --hidden --ignore node_modules --ignore .git -g ""'
      end

      -- Configure FZF colors to match your color scheme
      vim.g.fzf_colors = {
        ["fg"] = { "fg", "Normal" },
        ["bg"] = { "bg", "Normal" },
        ["hl"] = { "fg", "Comment" },
        ["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
        ["bg+"] = { "bg", "CursorLine", "CursorColumn" },
        ["hl+"] = { "fg", "Statement" },
        ["info"] = { "fg", "PreProc" },
        ["border"] = { "fg", "Ignore" },
        ["prompt"] = { "fg", "Conditional" },
        ["pointer"] = { "fg", "Exception" },
        ["marker"] = { "fg", "Keyword" },
        ["spinner"] = { "fg", "Label" },
        ["header"] = { "fg", "Comment" },
      }

      -- Configure actions
      vim.g.fzf_action = {
        ["ctrl-t"] = "tab split",
        ["ctrl-x"] = "split",
        ["ctrl-v"] = "vsplit",
      }

      -- Set default options
      local preview_cmd = "bat --style=numbers --color=always {}"
      vim.env.FZF_DEFAULT_OPTS = '--preview-window=right:60% --preview="'
        .. preview_cmd
        .. '" --bind=ctrl-p:preview-page-up,ctrl-n:preview-page-down'
    end,
  },

  -- Search Enhancement
  {
    "mileszs/ack.vim",
    lazy = false,
    priority = 1000,
    init = function()
      -- Set up Ag as the backend before plugin loads
      if vim.fn.executable("ag") == 1 then
        vim.g.ackprg = "ag --vimgrep"
      end
    end,
    config = function()
      -- Verify the command exists after plugin loads
      if vim.fn.exists(":Ack") == 0 then
        vim.notify("Ack command not available!", vim.log.levels.ERROR)
        return
      end

      -- Set up mappings
      vim.g.ack_mappings = {
        ["t"] = "<C-W><CR><C-W>Tzz",
        ["T"] = "<C-W><CR><C-W>TzzgT<C-W>j",
        ["o"] = "<CR>zz",
        ["O"] = "<CR>zz<C-W><C-W>:ccl<CR>zz",
        ["go"] = "<CR>zz<C-W>j",
        ["h"] = "<C-W><CR>zz<C-W>K",
        ["H"] = "<C-W><CR>zz<C-W>K<C-W>b",
        ["v"] = "<C-W><CR>zz<C-W>L<C-W>p<C-W>J<C-W>p",
        ["gv"] = "<C-W><CR>zz<C-W>L<C-W>p<C-W>J",
      }
    end,
  },

  -- Linting and Formatting
  {
    "w0rp/ale",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Basic settings
      vim.g.ale_open_list = 1
      vim.g.ale_list_window_size = 5
      vim.g.ale_lint_on_text_changed = 0
      vim.g.ale_lint_on_insert_leave = 0

      -- Configure linters per language
      vim.g.ale_linters = {
        go = { "gopls" },
        graphql = {},
        javascript = { "eslint" },
      }

      -- Linter-specific settings
      vim.g.ale_python_flake8_options = "--ignore=E501"
    end,
  },

  -- Session Management (in addition to vim-obsession)
  {
    "tpope/vim-obsession",
    cmd = "Obsession",
    config = function()
      -- Auto-create session files in designated directories
      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        callback = function()
          local session_dirs = { "projects/", "sites/" }
          local cwd = vim.fn.getcwd()
          for _, dir in ipairs(session_dirs) do
            if string.find(cwd, dir) then
              local session_file = vim.fn.getcwd() .. "/Session.vim"
              if vim.fn.filereadable(session_file) == 0 then
                vim.cmd("Obsession")
              end
            end
          end
        end,
      })
    end,
  },
}
