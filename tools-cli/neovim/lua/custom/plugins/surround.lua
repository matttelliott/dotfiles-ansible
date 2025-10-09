-- Surround plugin configuration
-- Add/change/delete surrounding delimiter pairs

return {
  'kylechui/nvim-surround',
  version = '*',
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup {}
  end,
}