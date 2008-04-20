" FileTree - treeview file explorer for vim
"
" Author:  Yury Altukhou
" Date:    2004-11-24
" Email:   wind-xp@tut.by
" Version: 1.0
"
" see :help FileTree.txt for detailed description


let FileTree_VERSION='1.0'

"{{{1 check dependency
try  
	runtim plugin/tree.vim
	if Tree_VERSION<'1.0'
		throw 'E484'
	endif
catch /E121.*/
	throw "FileTree_Error: You have to have tree.vim srcipt at least 1.0" 
endtry "}}}1

" setup command "{{{1

command! -nargs=* -complete=dir FileTree call FileTree(FileTree_Orientation,FileTree_Side,<f-args>)
command! -nargs=* -complete=dir LFileTree call FileTree(Tree_VerticalSplit,Tree_Left,<f-args>)
command! -nargs=* -complete=dir RFileTree call FileTree(Tree_VerticalSplit,Tree_Right,<f-args>)
command! -nargs=* -complete=dir TFileTree call FileTree(Tree_HorizontalSplit,Tree_Top,<f-args>)
command! -nargs=* -complete=dir BFileTree call FileTree(Tree_HorizontalSplit,Tree_Below,<f-args>)
command! -nargs=* -complete=dir CD call FileTree_CD(<f-args>)
command! -nargs=0 Popd call FileTree_Popd()
command! -nargs=1 -complete=dir Pushd call FileTree_Pushd(<f-args>)
command! -nargs=0 Dirs echo FileTree_Dirs()

"}}}1

" used variables "{{{1
"
" b:file_match_pattern  - filtering pattern
" b:show_hidden_files -- whether to show hidden files ( thous whith '.')
" b:FILETREE_BUFFER -- says that it is FileTree Buffer
" s:ATTRIBUTE_SEPARATOR=':'
" b:FileTree_directoryStack - string[] - a list of directories
" }}}1

function! FileTree(orientation,side,...) "{{{1
	" create explorer window
	" take argument as path, if given
	if a:0>0 "{{{2
		let path=a:1
	else
		" otherwise current dir
		let path=getcwd()
	end "}}}2

	let path=s:NormalizePath(path)
	"remove all trailing '/' or '\'
	let path=s:RemoveTrailingSlashes(path)
	call Tree_NewTreeWindow (path.'<d>',a:orientation,a:side,g:FileTree_WindowWidth,g:FileTree_WindowHeigh,"FileTree_InitOptions")
endfunction "}}}1

function! FileTree_CD (...) "{{{1
	if !exists("b:FILETREE_BUFFER") "{{{2
		"if this is not File tree buffer
		return
	endif "}}}2
	if a:0==0 "{{{2
		"on empty path go $HOME
		let path="~"
	else
		let path=a:1
	endif "}}}2
	if path=='-' "{{{2
		"go to previous directory
		lcd -
		let path =getcwd()
		lcd -
		return FileTree_CD (path)
	end "}}}2
	if path[0]=='=' "{{{2
		"if path is =n then go to nth directory in the stack
		let path=strpart(path,1)
		let path=FileTree_GetDirecoryInTheStack(path)
	end "}}}2
	let path=s:NormalizePath(path)
	let path=s:RemoveTrailingSlashes(path)
	call Tree_SetPath(path)
endfunction "}}}1

function! FileTree_Pushd(path) "{{{1
	if !exists("b:FILETREE_BUFFER") "{{{2
		"if this is not File tree buffer
		return
	endif "}}}2
	let path=s:NormalizePath(a:path)
	let b:FileTree_directoryStack=path."\n".b:FileTree_directoryStack
endfunction "}}}1

function! FileTree_Popd() "{{{1
	if !exists("b:FILETREE_BUFFER") "{{{2
		"if this is not File tree buffer
		return
	endif "}}}2
	if b:FileTree_directoryStack=='' "{{{2
		throw "FileTree_Error: direcotry stack is empty"
	endif "}}}2
	let path=GetNextLine(b:FileTree_directoryStack)
	let b:FileTree_directoryStack=CutFirstLine(b:FileTree_directoryStack)
	call FileTree_CD (path)
endfunction "}}}1

function! FileTree_Dirs() "{{{1
	if !exists("b:FILETREE_BUFFER") "{{{2
		"if this is not File tree buffer
		return
	endif "}}}2
	let stack=b:FileTree_directoryStack
	let newStack=''
	let i=0
	while stack!='' "{{{2
		let entry=GetNextLine(stack)
		let entry=i."\t".entry
		let newStack=newStack."\n".entry
		let i=i+1
		let stack=CutFirstLine(stack)
	endwhile "}}}2
	return newStack 
endfunction "}}}1

function! FileTree_GetDirecoryInTheStack(aNumber) "{{{1
	if !exists("b:FILETREE_BUFFER") "{{{2
		"if this is not File tree buffer
		return
	endif "}}}2
	let stack=b:FileTree_directoryStack
	let i=a:aNumber
	while i>0  "{{{2
		let stack=CutFirstLine(stack)
		let i=i-1
	endwhile "}}}2
	return GetNextLine(stack)
endfunction "}}}1

" callback functions for Tree Plugin

function! FileTree_InitOptions () "{{{1
	let b:FileTree_directoryStack=''
	let b:FILETREE_BUFFER=1
	let b:Tree_pathSeparator=s:FileTree_pathSeparator
	let s:ATTRIBUTE_SEPARATOR=':'
	let b:Tree_ColorFunction="FileTree_InitColors" 
	let b:Tree_IsLeafFunction="FileTree_IsLeaf" 
	let b:Tree_GetSubNodesFunction="FileTree_GetSubNodes" 
	let b:Tree_InitMappingsFunction="FileTree_InitMappings" 
	let b:Tree_OnLeafClick="FileTree_OnLeafClick"
	let b:Tree_OnPathChange="FileTree_OnPathChange"
	let b:file_match_pattern="*"
	let b:show_hidden_files=0
endfunction "}}}1

function! FileTree_InitColors () "{{{1 

	syn match Directory  "[^<>]\+\ze<d.*>"
	syn match File "[^<>]\+\ze<f.*>"
	syn match VimFile "[^<>]\+\.vim\ze<f.*>"
	syn match Hidden "<[^<>]*>"

	hi link FIle Label
	hi link VimFIle Label
	hi link Hidden Ignore	
	hi link Directory  Comment
endfunction "}}}1

function! FileTree_InitMappings () "{{{1
	noremap <silent> <buffer> M :call <SID>SetMatchPattern ()<CR>
	noremap <silent> <buffer> H :call <SID>ToggleShowHidden ()<CR>
	noremap <silent> <buffer> n :call <SID>InsertFilename ()<CR>
	noremap <silent> <buffer> p :call <SID>InsertFileContent ()<CR>
	noremap <silent> <buffer> s :call <SID>FileSee ()<CR>
	noremap <silent> <buffer> N :call <SID>FileRename ()<CR>
	noremap <silent> <buffer> D :call <SID>FileDelete ()<CR>
	noremap <silent> <buffer> C :call <SID>FileCopy ()<CR>
	noremap <silent> <buffer> O :call <SID>FileMove ()<CR>
endfunction	"}}}1

function! FileTree_IsLeaf (path) "{{{1 
	let attributes=s:GetAttributes(a:path)
	return attributes[0]=='f' 
endfunction "}}}1

function! FileTree_GetSubNodes (path) "{{{1 
	return s:ListDirEntries(a:path)
endfunction "}}}1

function! FileTree_OnLeafClick (path) "{{{1
	let path =s:RemoveAttributes(a:path)
	call s:OpenFile (path)
endfunction "}}}1

function! FileTree_OnPathChange( path) "{{{1
	let path=substitute(a:path,' ','\\ ','g')
	let path=s:RemoveAttributes(path)
	execute "lcd ".path.s:FileTree_pathSeparator
endfunction "}}}1

" script private functions

function! s:NormalizePath(path) "{{{1
	let path=fnamemodify(expand(a:path.s:FileTree_pathSeparator),":p")
	"let path=fnamemodify(expand(a:path.s:FileTree_pathSeparator),":~")
	return path
endfunction "}}}1

function! s:Init () "{{{1
	if has('win32') || has('dos32') || has('win16') || has('dos16') || has('win95') "{{{2
		let s:FileTree_pathSeparator='\'
	else
		let s:FileTree_pathSeparator='/'
	end "}}}2
	if !exists("g:FileTree_WindowHeigh") "{{{2
		let g:FileTree_WindowHeigh=10
	endif "}}}2
	if !exists("g:FileTree_WindowWidth") "{{{2
		let g:FileTree_WindowWidth=30
	endif "}}}2
	if !exists("g:FileTree_Orientation") "{{{2
		let g:FileTree_Orientation=1
	endif "}}}2
	if !exists("FileTree_Side") "{{{2
		let g:FileTree_Side=0
	endif "}}}2
endfunction "}}}1

function! s:OpenFile (path) "{{{1
	if filereadable(a:path) "{{{2
		" go to last accessed buffer
		wincmd p
		" append sequence for opening file
		execute "cd ".fnamemodify(a:path,":h")
		execute "e ".a:path
		setlocal modifiable
	endif "}}}2
endfunction "}}}1

function! s:ListDirEntries(path) "{{{1
	let path=<SID>RemoveAttributes(a:path).b:Tree_pathSeparator
	let attributes=s:GetAttributes(a:path)
	"find all files in the directory
	let fileList=glob(path.b:file_match_pattern)."\n"
	if b:show_hidden_files "{{{2
		" find all hidden files 
		let fileList=fileList.glob(path.'.'.b:file_match_pattern)."\n"
	endif "}}}2

	let fls=''
	let dirs="\n"

	let path=escape(path,"\\")

	while strlen(fileList)>0 "{{{2
		let entry=GetNextLine (fileList)
		let fileList=CutFirstLine(fileList)

		"skipping empty entries
		if entry=='' "{{{3 
			continue
		endif "}}}3

		if isdirectory(entry)  "{{{3
			"if entry is directory then mark it with d flag
			let entry=s:RemoveTrailingSlashes(entry)
			let entry=entry."<d>"
			let entry=substitute (entry,path,'','g')
			let dirs=dirs.entry."\n"
		else
			"if entry is file then mark it with f flag
			let entry=entry."<f>"
			let entry=substitute (entry,path,'','g')
			let fls=fls.entry."\n"
		endif "}}}3
	endwhile "}}}2

	"remove . && .. directories
	let dirs=substitute(dirs,"\n..<d>\n",'\n','g')
	let dirs=substitute(dirs,"\n.<d>\n",'\n','g')
	return dirs.fls
endfunction "}}}1

function! s:IsDirectory(path) "{{{1
	let path=s:RemoveAttributes (a:path)
	let attributes=s:GetAttributes (a:path)
	return attributes[0]!='f'
endfunction "}}}1

function! s:SetMatchPattern () "{{{1
	let b:file_match_pattern=input ("Match pattern: ",b:file_match_pattern)
	call Tree_RebuildTree()
endfunction "}}}1

function! s:ToggleShowHidden() "{{{1
	let b:show_hidden_files = 1-b:show_hidden_files
	call Tree_RebuildTree()
endfunction "}}}1

function! s:GetPathUnderCursor () "{{{1
	let path=Tree_GetPathUnderCursor()
	return <SID>RemoveAttributes (path)
endfunction "}}}1

function! s:RemoveAttributes (path) "{{{1
	return substitute(a:path,"<[^><]*>",'','g')
endfunction "}}}1

function! s:GetAttributes (path) "{{{1
	return substitute(a:path,'.*<\([^<>]*\)>$','\1','')
endfunction "}}}1

function! s:InsertFilename() "{{{1
	"normal 1|g^
	let filename=<SID>GetPathUnderCursor()
	wincmd p
	execute "normal a".filename
endfunction "}}}1

function! s:InsertFileContent() "{{{1
	"norm 1|g^
	let filename=<SID>GetPathUnderCursor()
	if filereadable(filename) "{{{2
		wincmd p
		execute "r ".filename
	endif "}}}2
endfunction "}}}1

function! s:FileSee() "{{{1
	let filename=<SID>GetPathUnderCursor()
	if filereadable(filename) "{{{2
		let i=system("see ".filename."&")
	endif "}}}2
endf "}}}1

function! s:FileRename() "{{{1
	let filename=<SID>GetPathUnderCursor()
	if filereadable(filename) "{{{2
		let newfilename=input("Rename to: ",filename)
		if filereadable(newfilename) "{{{3
			if input("File exists, overwrite?")=~"^[yY]" "{{{4
				setlocal ma
				let i=rename(filename,newfilename)
				" refresh display
				normal gg$
				call Tree_RebuildTree ()
			endif "}}}4
		else
			" rename file
			setlocal ma
			let i=rename(filename,newfilename)
			normal gg$
			call Tree_RebuildTree ()

		endif "}}}3
	endif "}}}2
endf "}}}1

function! s:FileDelete() "{{{1
	let filename=<SID>GetPathUnderCursor()
	if filereadable(filename) "{{{2
		if input("OK to delete ".fnamemodify(filename,":t")."? ")[0]=~"[yY]" "{{{3
			let i=delete(filename)
			setlocal modifiable
			normal ddg^
			setlocal nomodifiable nomodified
		endif "}}}3
	endif  "}}}2
endfunction "}}}1

function! s:FileCopy() "{{{1
	let filename=<SID>GetPathUnderCursor()
	if filereadable(filename) "{{{2
		let newfilename=input("Copy to: ",filename)
		if filereadable(newfilename) "{{{3
			if input("File exists, overwrite?")=~"^[yY]" "{{{4
				" copy file
				let i=system("cp -f ".filename." ".newfilename)
				call Tree_RebuildTree()	
			endif "}}}4
		else
			" copy file
			let i=system("cp ".filename." ".newfilename)
			call Tree_RebuildTree()
		endif "}}}3
	endif "}}}2
endfunction "}}}1

function! s:FileMove() "{{{1
	let filename=<SID>GetPathUnderCursor ()
	if filereadable(filename) "{{{2
		let newfilename=input("Move to: ",filename)
		if filereadable(newfilename) "{{{3
			if input("File exists, overwrite?")=~"^[yY]" "{{{4
				" move file
				let i=rename(filename,newfilename)
				call Tree_RebuildTree()
			endif "}}}4
		else
			" move file
			let i=rename(filename,newfilename)
			call Tree_RebuildTree()
		endif "}}}3
	endif "}}}2
endfunction "}}}1 

function! s:RemoveTrailingSlashes(path) "{{{1
		let path=substitute(a:path,'\'.s:FileTree_pathSeparator."*$",'','')
		if path=='' 
			let path='/'
		endif
		return path
endfunction "}}}1

call s:Init()
" vim:fdm=marker:
