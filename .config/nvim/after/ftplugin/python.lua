-- Python-specific settings (without the basic indentation settings)
vim.opt_local.textwidth = 88  -- Ruff formatter default
-- vim.opt_local.colorcolumn = "88"
vim.opt_local.formatoptions:remove('t')  -- Don't auto-wrap text
vim.opt_local.formatoptions:append('croql')

-- Set make program for Python files
vim.opt_local.makeprg = 'python %'

-- Add Python path to path option for better gf command
vim.opt_local.path:append(vim.fn.system("python -c 'import sys; print(\";\".join(sys.path))'"):gsub("\n", ""))
