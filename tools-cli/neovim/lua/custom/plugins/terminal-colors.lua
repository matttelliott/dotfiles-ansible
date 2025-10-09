-- Terminal color theme configuration
-- Uses the terminal's native color scheme

return {
  dir = vim.fn.stdpath('config'),
  name = 'terminal-colors',
  lazy = false,
  priority = 999,
  config = function()
    -- This theme uses the terminal's color palette
    vim.cmd [[
      highlight clear
      if exists("syntax_on")
        syntax reset
      endif
      set background=dark
      let g:colors_name = "terminal"

      " Terminal colors (0-15)
      let g:terminal_color_0 = "#000000"
      let g:terminal_color_1 = "#800000"
      let g:terminal_color_2 = "#008000"
      let g:terminal_color_3 = "#808000"
      let g:terminal_color_4 = "#000080"
      let g:terminal_color_5 = "#800080"
      let g:terminal_color_6 = "#008080"
      let g:terminal_color_7 = "#c0c0c0"
      let g:terminal_color_8 = "#808080"
      let g:terminal_color_9 = "#ff0000"
      let g:terminal_color_10 = "#00ff00"
      let g:terminal_color_11 = "#ffff00"
      let g:terminal_color_12 = "#0000ff"
      let g:terminal_color_13 = "#ff00ff"
      let g:terminal_color_14 = "#00ffff"
      let g:terminal_color_15 = "#ffffff"

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
      highlight Underlined ctermfg=4 cterm=underline guifg=NONE gui=underline
      highlight Error ctermfg=15 ctermbg=1 guifg=NONE guibg=NONE
      highlight Todo ctermfg=0 ctermbg=3 guifg=NONE guibg=NONE
      highlight Visual ctermbg=8 guibg=NONE
      highlight Search ctermfg=0 ctermbg=3 guifg=NONE guibg=NONE
      highlight IncSearch ctermfg=0 ctermbg=11 guifg=NONE guibg=NONE
      highlight StatusLine ctermfg=15 ctermbg=8 cterm=NONE guifg=NONE guibg=NONE gui=NONE
      highlight StatusLineNC ctermfg=7 ctermbg=0 cterm=NONE guifg=NONE guibg=NONE gui=NONE
      highlight VertSplit ctermfg=8 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
      highlight Folded ctermfg=8 ctermbg=0 guifg=NONE guibg=NONE
      highlight FoldColumn ctermfg=8 ctermbg=NONE guifg=NONE guibg=NONE
      highlight SignColumn ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
      highlight Pmenu ctermfg=7 ctermbg=0 guifg=NONE guibg=NONE
      highlight PmenuSel ctermfg=0 ctermbg=3 guifg=NONE guibg=NONE
      highlight PmenuSbar ctermbg=8 guibg=NONE
      highlight PmenuThumb ctermbg=7 guibg=NONE
      highlight TabLine ctermfg=7 ctermbg=0 cterm=NONE guifg=NONE guibg=NONE gui=NONE
      highlight TabLineFill ctermfg=7 ctermbg=0 cterm=NONE guifg=NONE guibg=NONE gui=NONE
      highlight TabLineSel ctermfg=0 ctermbg=7 cterm=NONE guifg=NONE guibg=NONE gui=NONE
      highlight Directory ctermfg=4 guifg=NONE
      highlight DiffAdd ctermfg=2 ctermbg=0 guifg=NONE guibg=NONE
      highlight DiffChange ctermfg=3 ctermbg=0 guifg=NONE guibg=NONE
      highlight DiffDelete ctermfg=1 ctermbg=0 guifg=NONE guibg=NONE
      highlight DiffText ctermfg=4 ctermbg=0 cterm=bold guifg=NONE guibg=NONE gui=bold
      highlight MatchParen ctermfg=0 ctermbg=3 guifg=NONE guibg=NONE
      highlight NonText ctermfg=8 guifg=NONE
      highlight SpecialKey ctermfg=8 guifg=NONE
      highlight Title ctermfg=5 guifg=NONE
      highlight WildMenu ctermfg=0 ctermbg=3 guifg=NONE guibg=NONE
      highlight WarningMsg ctermfg=1 guifg=NONE
      highlight ErrorMsg ctermfg=15 ctermbg=1 guifg=NONE guibg=NONE
      highlight Question ctermfg=2 guifg=NONE
      highlight MoreMsg ctermfg=2 guifg=NONE
      highlight ModeMsg ctermfg=3 cterm=bold guifg=NONE gui=bold

      " LSP and Diagnostic highlights
      highlight DiagnosticError ctermfg=1 guifg=NONE
      highlight DiagnosticWarn ctermfg=3 guifg=NONE
      highlight DiagnosticInfo ctermfg=4 guifg=NONE
      highlight DiagnosticHint ctermfg=6 guifg=NONE
      highlight DiagnosticUnderlineError cterm=underline ctermfg=1 gui=underline guifg=NONE
      highlight DiagnosticUnderlineWarn cterm=underline ctermfg=3 gui=underline guifg=NONE
      highlight DiagnosticUnderlineInfo cterm=underline ctermfg=4 gui=underline guifg=NONE
      highlight DiagnosticUnderlineHint cterm=underline ctermfg=6 gui=underline guifg=NONE

      " TreeSitter highlights
      highlight @variable ctermfg=7 guifg=NONE
      highlight @variable.builtin ctermfg=5 guifg=NONE
      highlight @variable.parameter ctermfg=6 guifg=NONE
      highlight @constant ctermfg=1 guifg=NONE
      highlight @constant.builtin ctermfg=5 guifg=NONE
      highlight @constant.macro ctermfg=1 guifg=NONE
      highlight @string ctermfg=2 guifg=NONE
      highlight @string.regex ctermfg=3 guifg=NONE
      highlight @string.escape ctermfg=6 guifg=NONE
      highlight @character ctermfg=2 guifg=NONE
      highlight @number ctermfg=5 guifg=NONE
      highlight @boolean ctermfg=5 guifg=NONE
      highlight @float ctermfg=5 guifg=NONE
      highlight @function ctermfg=4 guifg=NONE
      highlight @function.builtin ctermfg=6 guifg=NONE
      highlight @function.macro ctermfg=1 guifg=NONE
      highlight @parameter ctermfg=6 guifg=NONE
      highlight @method ctermfg=4 guifg=NONE
      highlight @field ctermfg=6 guifg=NONE
      highlight @property ctermfg=6 guifg=NONE
      highlight @constructor ctermfg=4 guifg=NONE
      highlight @conditional ctermfg=3 guifg=NONE
      highlight @repeat ctermfg=3 guifg=NONE
      highlight @label ctermfg=3 guifg=NONE
      highlight @operator ctermfg=3 guifg=NONE
      highlight @keyword ctermfg=5 guifg=NONE
      highlight @exception ctermfg=1 guifg=NONE
      highlight @type ctermfg=4 guifg=NONE
      highlight @type.builtin ctermfg=4 guifg=NONE
      highlight @structure ctermfg=6 guifg=NONE
      highlight @include ctermfg=5 guifg=NONE
      highlight @punctuation.delimiter ctermfg=7 guifg=NONE
      highlight @punctuation.bracket ctermfg=7 guifg=NONE
      highlight @punctuation.special ctermfg=5 guifg=NONE
      highlight @comment ctermfg=8 guifg=NONE
      highlight @tag ctermfg=1 guifg=NONE
      highlight @tag.delimiter ctermfg=7 guifg=NONE
      highlight @text ctermfg=7 guifg=NONE
      highlight @text.strong cterm=bold gui=bold
      highlight @text.emphasis cterm=italic gui=italic
      highlight @text.underline cterm=underline gui=underline
      highlight @text.title ctermfg=5 guifg=NONE
      highlight @text.literal ctermfg=2 guifg=NONE
      highlight @text.uri ctermfg=4 cterm=underline guifg=NONE gui=underline
    ]]

    -- Only apply colorscheme if terminal theme is selected
    if vim.g.colorscheme_choice == 'terminal' then
      vim.cmd 'colorscheme terminal'
    end
  end,
}