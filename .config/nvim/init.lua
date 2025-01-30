-- Set leader keys early
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Load utility functions
require("utils")

-- Load core options and autocmds
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Load plugin management and configurations
require("plugins")

-- Add any additional local configurations
local add_ons_path = vim.fn.expand("~/.vim/.vimrc_add_ons")
if vim.fn.filereadable(add_ons_path) == 1 then
    vim.cmd('source ' .. add_ons_path)
end
