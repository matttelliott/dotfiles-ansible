-- Custom Plugins
-- Add new plugins here without modifying kickstart.nvim
-- All plugins will be managed by lazy.nvim (already set up in kickstart)
-- Each plugin is in its own file for better organization

return {
  -- Load all plugin configurations from separate files
  require('custom.plugins.tokyonight'),
  require('custom.plugins.autopairs'),
  require('custom.plugins.surround'),
  require('custom.plugins.comment'),
  require('custom.plugins.neo-tree'),
  require('custom.plugins.formatting'),
  require('custom.plugins.treesitter'),
}