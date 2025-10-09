-- LSP server configurations for our languages
-- This file is loaded by custom/init.lua to extend kickstart's LSP setup

local M = {}

-- Define our language servers
M.servers = {
  -- Go
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
  },
  
  -- Python  
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = 'basic',
          autoImportCompletions = true,
        },
      },
    },
  },
  
  -- Rust
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = 'clippy',
        },
      },
    },
  },
  
  -- TypeScript/JavaScript
  ts_ls = {},
  
  -- JSON
  jsonls = {},
  
  -- YAML
  yamlls = {},
  
  -- Bash
  bashls = {},
  
  -- Docker
  dockerls = {},
  docker_compose_language_service = {},
  
  -- Markdown
  marksman = {},
}

-- Additional tools to install (formatters, linters)
M.tools = {
  -- Go
  'gofumpt',
  'golangci-lint',
  'delve',
  
  -- Python
  'black',
  'ruff',
  'mypy',
  'debugpy',
  
  -- JavaScript/TypeScript
  'prettier',
  'eslint_d',
  
  -- Shell
  'shfmt',
  'shellcheck',
  
  -- Lua
  'stylua',
}

return M