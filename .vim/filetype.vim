if exists("did\_load\_filetypes")
  finish
endif

augroup markdown
  au! BufRead,BufNewFile *.mkd   setfiletype mkd
  au! BufRead,BufNewFile *.markdown setfiletype mkd

augroup textile
  au! BufRead,BufNewFile *.textile setfiletype textile

augroup haml
  au! BufRead,BufNewFile *.haml         setfiletype haml

augroup sass
  au! BufRead,BufNewFile *.sass         setfiletype sass

augroup end
