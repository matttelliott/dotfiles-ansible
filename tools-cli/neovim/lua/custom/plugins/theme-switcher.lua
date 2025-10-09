-- Theme switcher configuration
-- Allows switching between Tokyo Night and Terminal themes

return {
  dir = vim.fn.stdpath('config'),
  name = 'theme-switcher',
  lazy = false,
  priority = 1001,
  config = function()
    -- Default to tokyonight theme
    vim.g.colorscheme_choice = vim.g.colorscheme_choice or 'tokyonight'

    -- Function to apply terminal theme
    local function apply_terminal_theme()
      vim.cmd [[
        highlight clear
        if exists("syntax_on")
          syntax reset
        endif
        set background=dark
        let g:colors_name = "terminal"

        " Use terminal colors for highlighting
        highlight Normal ctermfg=7 ctermbg=NONE guifg=NONE guibg=NONE
        highlight LineNr ctermfg=8 guifg=NONE
        highlight CursorLineNr ctermfg=3 guifg=NONE
        highlight CursorLine cterm=NONE ctermbg=0 gui=NONE guibg=NONE
        highlight Comment ctermfg=8 guifg=NONE
        highlight Constant ctermfg=1 guifg=NONE
        highlight String ctermfg=2 guifg=NONE
        highlight Identifier ctermfg=6 guifg=NONE
        highlight Statement ctermfg=3 guifg=NONE
        highlight PreProc ctermfg=5 guifg=NONE
        highlight Type ctermfg=4 guifg=NONE
        highlight Special ctermfg=5 guifg=NONE
        highlight Visual ctermbg=8 guibg=NONE
        highlight Search ctermfg=0 ctermbg=3 guifg=NONE guibg=NONE
        highlight StatusLine ctermfg=15 ctermbg=8 cterm=NONE guifg=NONE guibg=NONE gui=NONE
        highlight StatusLineNC ctermfg=7 ctermbg=0 cterm=NONE guifg=NONE guibg=NONE gui=NONE
        highlight Pmenu ctermfg=7 ctermbg=0 guifg=NONE guibg=NONE
        highlight PmenuSel ctermfg=0 ctermbg=3 guifg=NONE guibg=NONE
        highlight Directory ctermfg=4 guifg=NONE
        highlight MatchParen ctermfg=0 ctermbg=3 guifg=NONE guibg=NONE

        " LSP and Diagnostic highlights
        highlight DiagnosticError ctermfg=1 guifg=NONE
        highlight DiagnosticWarn ctermfg=3 guifg=NONE
        highlight DiagnosticInfo ctermfg=4 guifg=NONE
        highlight DiagnosticHint ctermfg=6 guifg=NONE
      ]]
    end

    -- Function to switch themes
    local function switch_theme(theme)
      vim.g.colorscheme_choice = theme
      if theme == 'tokyonight' then
        vim.cmd 'colorscheme tokyonight-night'
      elseif theme == 'terminal' then
        apply_terminal_theme()
      end
    end

    -- Create user commands for theme switching
    vim.api.nvim_create_user_command('ThemeTokyoNight', function()
      switch_theme('tokyonight')
      print('Switched to Tokyo Night theme')
    end, {})

    vim.api.nvim_create_user_command('ThemeTerminal', function()
      switch_theme('terminal')
      print('Switched to Terminal theme')
    end, {})

    vim.api.nvim_create_user_command('ThemeToggle', function()
      if vim.g.colorscheme_choice == 'tokyonight' then
        switch_theme('terminal')
        print('Switched to Terminal theme')
      else
        switch_theme('tokyonight')
        print('Switched to Tokyo Night theme')
      end
    end, {})

    -- Add keymaps for theme switching
    vim.keymap.set('n', '<leader>tt', ':ThemeToggle<CR>', { desc = '[T]heme [T]oggle' })
    vim.keymap.set('n', '<leader>t1', ':ThemeTokyoNight<CR>', { desc = '[T]heme Tokyo Night' })
    vim.keymap.set('n', '<leader>t2', ':ThemeTerminal<CR>', { desc = '[T]heme Terminal' })

    -- Apply default theme on startup
    switch_theme(vim.g.colorscheme_choice)
  end,
}