
" Vim syntax file
" Language: Procfile
" Maintainer: Charles Maresh
" Latest Revision: 2021-09-13

if exists("b:current_syntax") && b:current_syntax == "procfile"
  finish
endif

syn case match


syn region procfileLine    start='^'      end='$' oneline contains=procfileComment,procfileName,procfileEnv,procfileBundle,procfileVariable keepend
syn region procfileComment start='#'      end='$' oneline contained
syn match procfileName    /^\w\+:/ contained contains=procfileInvalidName,procfileValidName 

syn region procfileInvalidName start='^' end=':'                          oneline contained
syn region procfileValidName   start='^' end='\(web\|_worker\|_handler\|_scheduler\|_listener\):' oneline contained



" syn region procfileBundle  start='bundle' end='$' oneline contained contains=procfileEnvSetting,procfileComment,procfileVariable


" syn keyword procfileEnvProg env contained
"
syn region procfileEnv     start='env' end='$' oneline contained contains=procfileBundle,procfileEnvSetting,procfileEnvProg transparent
syn match procfileEnvSetting    /\s\S\+=\S\+/ contained contains=procfileEnvAssignment
syn match procfileEnvAssignment /=\S\+/       contained contains=procfileEnvOperator
syn match procfileEnvOperator   /=/           contained

" syn match procfileVariable /\$\w\+/ contained



hi def link procfileLine        Normal " Green
hi def link procfileComment       Comment " Grey

hi def link procfileBundle        Normal
hi def link procfileEnvAssignment String
hi def link procfileEnvOperator   Operator
hi def link procfileEnvProg       Identifier
hi def link procfileEnvSetting    Type " Orange
hi def link procfileVariable      Type
hi def link procfileInvalidName   DiffDelete
hi def link procfileName          Special
hi def link procfileValidName     Special

let b:current_syntax = "procfile"
