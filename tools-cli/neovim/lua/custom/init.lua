-- Custom Neovim Configuration
-- This file loads all custom modules on top of kickstart.nvim
-- Keeping customizations separate allows easy upstream updates

-- Load all custom modules
require('custom.keymaps')     -- Custom key mappings
require('custom.options')     -- Custom options and settings
require('custom.plugins')     -- Custom plugins