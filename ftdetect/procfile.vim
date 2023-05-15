autocmd BufNewFile,BufRead Procfile,Procfile\.\(dev\|lean\)
      \ if &ft == 'conf' |
      \   set ft=procfile |
      \ else |
      \   setf procfile |
      \ endif
