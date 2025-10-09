-- Treesitter configuration
-- Extends kickstart's parsers with our languages

return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = {
      -- Kickstart defaults
      'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 
      'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc',
      
      -- Our languages
      'go', 'gomod', 'gosum', 'gowork',
      'python', 'toml',
      'rust',
      'javascript', 'typescript', 'tsx',  -- jsx is included in javascript
      'json', 'jsonc',
      'yaml',
      'dockerfile',
      'css', 'scss',
      'sql',
      'regex',
      'gitignore', 'gitcommit', 'git_rebase',
    },
    auto_install = true,
  },
}