function! AJGitCommitMsg()
	let s:full_branch = system('git symbolic-ref --short HEAD')
	let s:parsed_ticket = substitute(s:full_branch,
		\ '\v.*(AR-[0-9]*).*', '\1', '')

	if s:full_branch ==# s:parsed_ticket
		return
	endif

	execute "normal! i[" . s:parsed_ticket . "] "
endfunction
