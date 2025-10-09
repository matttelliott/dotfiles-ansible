-- Auto-formatting configuration
-- Format on save for supported languages

return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')
    
    conform.setup({
      formatters_by_ft = {
        -- Go
        go = { 'gofumpt' },
        
        -- Python
        python = { 'ruff', 'black' },
        
        -- Rust
        rust = { 'rustfmt' },
        
        -- JavaScript/TypeScript/React
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        jsx = { 'prettier' },
        tsx = { 'prettier' },
        
        -- Web
        html = { 'prettier' },
        css = { 'prettier' },
        scss = { 'prettier' },
        
        -- Data formats
        json = { 'prettier' },
        jsonc = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        
        -- Shell
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },
        
        -- Lua
        lua = { 'stylua' },
        
        -- Use the "*" filetype to run formatters on all files
        ["*"] = { "trim_whitespace" },
      },
      
      -- Disable format on save
      format_on_save = false,
    })
    
    -- Create format command with <leader>f
    vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = '[F]ormat buffer' })
  end,
}