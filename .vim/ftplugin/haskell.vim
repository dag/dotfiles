nnoremap <buffer> <silent> <leader>hi :Tabularize haskell_imports<cr>
vnoremap <buffer> <silent> <leader>hi :Tabularize haskell_imports<cr>

setlocal omnifunc=necoghc#omnifunc

nnoremap <buffer> <silent> <leader>mt :GhcModType<cr>
nnoremap <buffer> <silent> <leader>me :GhcModExpand<cr>
