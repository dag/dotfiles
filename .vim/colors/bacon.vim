" http://www.colourlovers.com/palette/1154653/c_u_r_r_y_m_.
" http://www.colourlovers.com/palette/1186061/natures_weapons.
" http://www.colourlovers.com/palette/1185357/%5Bw%5D_Cumulo_Crescendo
" http://www.colourlovers.com/palette/1968923/Blue_is_jeans
" http://www.colourlovers.com/palette/1968940/Day_its_over

se bg=dark
hi clear
sy reset

let g:colors_name = "bacon"

hi ColorColumn                guibg=#2f2c25
hi Comment      guifg=#afc2ac               gui=italic
hi Constant     guifg=#d9ce74               gui=italic
hi DiffAdd      guifg=#979d91 guibg=NONE    gui=bold
hi DiffChange                 guibg=#2f2c25
hi DiffDelete   guifg=#a63935 guibg=NONE    gui=NONE
hi DiffText     guifg=#979d91 guibg=#2f2c25 gui=bold
hi Error                      guibg=#a63935
hi Identifier   guifg=#d6c9b6               gui=bold
hi LineNr       guifg=#979d91
hi Normal       guifg=#d6c9b6 guibg=#3b332f
hi PreCondit    guifg=#979d91               gui=bold
hi PreProc      guifg=#979d91               gui=italic
hi Question     guifg=#a3ae1e guibg=#3b332f
hi Special      guifg=#988c72
hi Statement    guifg=#988c72               gui=bold
hi StatusLineNC guifg=#979d91
hi Title        guifg=#979d91               gui=bold
hi Todo         guifg=#3b332f guibg=#a3ae1e
hi Type         guifg=#988c72               gui=bold
hi Visual       guibg=#2f2c25
hi WarningMsg   guifg=#a63935

hi! link Directory      Statement
hi! link ErrorMsg       Error
hi! link FoldColumn     LineNr
hi! link Folded         Comment
hi! link MatchParen     Todo
hi! link NonText        LineNr
hi! link Operator       Special
hi! link Pmenu          StatusLineNC
hi! link PmenuSel       StatusLine
hi! link SignColumn     LineNr
hi! link SpecialComment PreProc
hi! link SpecialKey     Comment
hi! link Underlined     PreProc
