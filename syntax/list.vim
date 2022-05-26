" Vim syntax file
" Language: list
" Maintainer: Gregor A. Cieslak <gregor.a.cieslak@gmail.com>
" Latest Revision: 23 Apr 2016

"if exists("b:current_syntax")
"  finish
"endif

syntax match listProject /^.*:\s/
highlight default link listProject Identifier

syntax match listHeader /.*:$/
highlight default link listHeader String

syntax match listGroup /^  .*=$/
highlight default link listGroup Type

syntax match listDone /^x .*/
highlight default link listDone Comment

syntax match listImportant /!!/
highlight default link listImportant Operator

syntax match listPlace /@\S*/
highlight default link listPlace Float

syntax match listTodo /^\s*#.*/
highlight default link listTodo Delimiter

syntax match listFail /^f .*$/
highlight default link listFail Keyword

syntax match listFinished /^d .*$/
highlight default link listFinished Function
