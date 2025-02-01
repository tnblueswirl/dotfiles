-- SQL-specific settings
vim.opt_local.textwidth = 88

-- SQL formatting options
vim.opt_local.formatoptions:remove('t')  -- Don't auto-wrap text
vim.opt_local.formatoptions:append('croql')

-- Add SQL keywords to complete option
vim.opt_local.complete:append('k')
