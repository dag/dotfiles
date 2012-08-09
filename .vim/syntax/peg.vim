syn clear

setlocal iskeyword=@,48-57,_,-

syn match Comment /;.*/
syn match Identifier /^\k\+\ze\s*<-/
syn match Delimiter /[()]/
syn match Operator /[+*!?\/&]/
syn match Structure /<-/
