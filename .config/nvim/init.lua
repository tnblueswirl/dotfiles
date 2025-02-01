-- Set leader keys early
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Load utility functions
require("utils")

-- Load core options and autocmds
require("core.options")
require("core.keymaps")

-- Load plugin management and configurations
require("plugins")

-- Load autocommands now that everything is defined
require("core.autocmds")

-- Add any additional local configurations
local add_ons_path = vim.fn.expand("~/.vim/.vimrc_add_ons")
if vim.fn.filereadable(add_ons_path) == 1 then
    vim.cmd('source ' .. add_ons_path)
end
