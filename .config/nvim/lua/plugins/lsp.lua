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

      -- Refresh CoC
      vim.keymap.set("i", "<C-x><C-x>", "coc#refresh()", { silent = true, expr = true })

      -- Handle <CR> for completion
      local function confirm_completion()
        if vim.fn.pumvisible() ~= 0 then
          if vim.fn.complete_info ~= nil and vim.fn.complete_info().selected ~= -1 then
            return "<C-y>"
          end
          return "<C-y>"
        else
          return "<C-g>u<CR>"
        end
      end
      vim.keymap.set("i", "<CR>", confirm_completion, { expr = true })

      -- GoTo code navigation
      vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
      -- vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
      -- vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
      vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

      -- Show documentation in preview window
      local function show_documentation()
        local filetype = vim.bo.filetype
        if filetype == "vim" or filetype == "help" then
          vim.cmd("h " .. vim.fn.expand("<cword>"))
        else
          vim.fn.CocActionAsync("doHover")
        end
      end
      vim.keymap.set("n", "K", show_documentation, { silent = true })

      -- Navigate diagnostics
      vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev-error)", { silent = true })
      vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next-error)", { silent = true })

      -- Add Format command
      vim.api.nvim_create_user_command("Format", function()
        vim.fn.CocAction("format")
      end, {})
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
