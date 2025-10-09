-- Auto-pairs configuration
-- Automatically close brackets, quotes, etc.

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    require('nvim-autopairs').setup {}
  end,
}