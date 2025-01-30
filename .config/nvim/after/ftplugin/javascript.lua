-- Add node_modules to path for better gf command
vim.opt_local.path:append("node_modules")
vim.opt_local.suffixesadd:append(".js")
vim.opt_local.suffixesadd:append(".jsx")
vim.opt_local.suffixesadd:append(".ts")
vim.opt_local.suffixesadd:append(".tsx")

-- Include node_modules/.bin in path for local tools
vim.opt_local.path:append("node_modules/.bin")
