-- Custom Options
-- Additional vim options beyond kickstart defaults

local opt = vim.opt

-- UI
opt.pumheight = 10         -- Pop up menu height
opt.cmdheight = 1          -- Command line height
opt.conceallevel = 0       -- Show `` in markdown files
opt.showtabline = 2        -- Always show tabs
opt.laststatus = 3         -- Global statusline

-- Behavior
opt.backup = false         -- Don't create backup files
opt.swapfile = false       -- Don't create swap files
opt.writebackup = false    -- Don't write backup files
opt.undofile = true        -- Enable persistent undo
opt.updatetime = 300       -- Faster completion
opt.timeoutlen = 300       -- Faster key sequence completion

-- Splits
opt.splitbelow = true      -- Horizontal splits go below
opt.splitright = true      -- Vertical splits go right

-- Search
opt.smartcase = true       -- Smart case search
opt.smartindent = true     -- Smart indentation

-- Visual
opt.termguicolors = true   -- True color support
opt.wrap = false           -- Don't wrap lines
opt.scrolloff = 8          -- Keep 8 lines above/below cursor
opt.sidescrolloff = 8      -- Keep 8 columns left/right of cursor

-- Line numbers
opt.number = true          -- Show line numbers
opt.relativenumber = true  -- Relative line numbers
opt.numberwidth = 4        -- Line number column width

-- Tabs
opt.expandtab = true       -- Use spaces instead of tabs
opt.shiftwidth = 2         -- Indent size
opt.tabstop = 2            -- Tab size
opt.softtabstop = 2        -- Soft tab size