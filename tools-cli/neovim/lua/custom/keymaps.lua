-- Custom Keymaps
-- All custom keymaps go here to avoid modifying kickstart.nvim

local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window" })

-- Resize windows with arrows
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move text up and down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better paste
map("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Quick save
map("n", "<leader>w", ":w<CR>", { desc = "[W]rite file" })

-- File explorer (Neo-tree)
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "[E]xplorer toggle", silent = true })
map("n", "<leader>E", ":Neotree reveal<CR>", { desc = "[E]xplorer reveal current file", silent = true })

-- Telescope file search (including hidden, excluding gitignored)
map("n", "<leader>o", function()
  require('telescope.builtin').find_files({ hidden = true })
end, { desc = "[O]pen file (includes hidden)" })

-- Override kickstart's current buffer search with project-wide grep
-- Set this after Telescope loads to override the default
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  callback = function(event)
    if event.data == "telescope.nvim" then
      vim.keymap.set("n", "<leader>/", function()
        require('telescope.builtin').live_grep({ 
          additional_args = { "--hidden" },
          previewer = true,
          layout_strategy = 'horizontal',
          layout_config = {
            preview_width = 0.5,
          },
        })
      end, { desc = "[/] Search in files (includes hidden)" })
    end
  end,
})

-- Also set it immediately in case Telescope is already loaded
map("n", "<leader>/", function()
  require('telescope.builtin').live_grep({ 
    additional_args = { "--hidden" },
    previewer = true,
    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.5,
    },
  })
end, { desc = "[/] Search in files (includes hidden)" })

-- Better escape (jk/kj to exit insert mode)
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("i", "kj", "<ESC>", { desc = "Exit insert mode" })
map("i", "JK", "<ESC>", { desc = "Exit insert mode" })
map("i", "KJ", "<ESC>", { desc = "Exit insert mode" })

-- NOTE: All keymaps include descriptions for which-key integration

