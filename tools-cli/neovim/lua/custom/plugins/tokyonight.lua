-- Tokyo Night theme configuration
-- Matches terminal color scheme

return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- Don't automatically apply the colorscheme
    -- The theme-switcher will handle this
  end,
}