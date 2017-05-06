nnoremap <Leader>g :set operatorfunc=<SID>GrepOperator<CR>g@
nnoremap <Leader>G :set operatorfunc=<SID>GrepOperatorTab<CR>g@
vnoremap <Leader>g :<C-U>call <SID>GrepOperator(visualmode())<CR>
vnoremap <Leader>G :<C-U>call <SID>GrepOperatorTab(visualmode())<CR>

" FUNCTION OVERVIEW
" Use movement commands or visual highlighting to search using "Ack" (if
" present, falling back to "grep", if not).
"
" The above-defined mappings will open the search in the current tab if "g" is
" used, and it will be opened in a new tab if "G" is used.
"
" CREDITS
" This function is a slightly modified version of what Steve Losh presented in
" his Learn Vimscript the Hard Way grep-operator lesson.
" http://learnvimscriptthehardway.stevelosh.com/chapters/33.html
function! s:GrepOperator(type, ...)
	let s:saved_unnamed_register = @*

	if a:type ==# 'v'
		normal! `<v`>y
	elseif a:type ==# 'char'
		normal! `[v`]y
	else
		return
	endif

	if (a:0 == 1) && (a:1 == 1)
		tabnew
	endif

	if exists(":Ack")
		silent! execute "Ack! " . shellescape(@*) . " ."
	else
		silent execute "grep! -R " . shellescape(@*) . " ."
	endif

	" Open the errors list
	copen

	let @* = s:saved_unnamed_register
endfunction

function! s:GrepOperatorTab(type, ...)
	call <SID>GrepOperator(a:type, 1)
endfunction
