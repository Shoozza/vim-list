" Vim indent file
" Language:    List
" Maintainer:  Gregor A. Cieslak <gregor.a.cieslak@gmail.com>
" Created:     2016 Feb 29
" Last Change: 2022 Jan 06


setlocal indentexpr=GetListIndent(v:lnum)

function! s:GetPrevNonCommentLineNum(line)
	" Skip lines starting with a comment
	let SKIP_LINES = '\s*#\s'

	let nline = a:line
	while nline > 0
		let nline = prevnonblank(nline-1)
		if getline(nline) !~? SKIP_LINES
			break
		endif
	endwhile

	return nline
endfunction


function! GetListIndent(line)
	if a:line == 1
		return 0
	endif

	let text = getline(a:line)
	if text =~ '^.*:$'
		return 0
	endif
	if text =~ '^\s*#[^ ]'
		return 0
	endif
	if text =~ '^.*=$'
		return 2
	endif

	let prev_line = s:GetPrevNonCommentLineNum(a:line)
	let prev_text = getline(prev_line)
	let prev_indent = indent(prev_line)
	let indent = 2

	if prev_text =~ '^  [^ =].*=$'
		return 4
	endif
	if prev_text =~ '^.*:$'
		return 2
	endif
	if prev_text =~ '  =+$'
		return 2
	endif
	if prev_text =~ '^  [^ ].*=$'
		return 2
	endif
	if prev_text =~ '^\s*#[^ ]'
		return 0
	endif

	return prev_indent
endfunction

" vim: tabstop=8:softtabstop=8:shiftwidth=8:noexpandtab
