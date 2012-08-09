compiler cabal

nnoremap <buffer> <silent> <leader>hi :Tabularize haskell_imports<cr>
vnoremap <buffer> <silent> <leader>hi :Tabularize haskell_imports<cr>
nnoremap <buffer> <silent> <leader>hc :Tabularize haskell_comments<cr>
vnoremap <buffer> <silent> <leader>hc :Tabularize haskell_comments<cr>
nnoremap <buffer> <silent> <leader>ht :Tabularize haskell_types<cr>
vnoremap <buffer> <silent> <leader>ht :Tabularize haskell_types<cr>
nnoremap <buffer> <silent> <leader>hd :Tabularize haskell_do_arrows<cr>
vnoremap <buffer> <silent> <leader>hd :Tabularize haskell_do_arrows<cr>
nnoremap <buffer> <silent> <leader>hp :Tabularize haskell_pattern_arrows<cr>
vnoremap <buffer> <silent> <leader>hp :Tabularize haskell_pattern_arrows<cr>
nnoremap <buffer> <silent> <leader>hb :Tabularize haskell_bindings<cr>
vnoremap <buffer> <silent> <leader>hb :Tabularize haskell_bindings<cr>

vnoremap <buffer> <silent> <leader>pf :PointFree!<cr>

setlocal omnifunc=necoghc#omnifunc

nnoremap <buffer> <silent> <leader>mt :GhcModType<cr>
nnoremap <buffer> <silent> <leader>mc :GhcModTypeClear<cr>
nnoremap <buffer> <silent> <leader>me :GhcModExpand<cr>
