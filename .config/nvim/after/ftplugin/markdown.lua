-- Markdown-specific settings
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2
vim.opt_local.textwidth = 88
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

-- Enable spell checking for markdown files
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

-- Add common markdown file extensions to suffixesadd
vim.opt_local.suffixesadd:append(".md")
vim.opt_local.suffixesadd:append(".markdown")
