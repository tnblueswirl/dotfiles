-- PHP-specific settings (without the basic indentation settings)
vim.opt_local.textwidth = 120
vim.opt_local.colorcolumn = "120"
vim.opt_local.formatoptions:remove('t')
vim.opt_local.formatoptions:append('croql')

-- Set PHP include paths
vim.opt_local.path:append("/usr/share/php")
vim.opt_local.path:append("vendor")

-- Set PHP errorformat
vim.opt_local.errorformat = [[%m\ in\ %f\ on\ line\ %l]]

-- Set makeprg for PHP files
vim.opt_local.makeprg = 'php -l %'
