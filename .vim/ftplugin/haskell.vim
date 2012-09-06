compiler cabal

nnoremap <buffer> <silent> <leader>hi :Tabularize haskell_imports<cr>
vnoremap <buffer> <silent> <leader>hi :Tabularize haskell_imports<cr>
nnoremap <buffer> <silent> <leader>hc :Tabularize haskell_comments<cr>
vnoremap <buffer> <silent> <leader>hc :Tabularize haskell_comments<cr>

setlocal omnifunc=necoghc#omnifunc

nnoremap <buffer> <silent> <leader>gt :HdevtoolsType<cr>
nnoremap <buffer> <silent> <leader>gc :HdevtoolsClear<cr>
nnoremap <buffer> <silent> <leader>ge :GhcModExpand<cr>
nnoremap <buffer> <silent> <leader>gi :HdevtoolsInfo<cr>
