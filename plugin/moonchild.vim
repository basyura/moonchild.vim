scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

augroup MoonChild
  autocmd!
  autocmd InsertLeave * :call s:escape()
augroup END

function! s:escape()
  if get(b:, 'moonchild', 0)
    :w
    let b:moonchild_counter = get(b:, 'moonchild_counter', 0) + 1
    if b:moonchild_counter % 3 == 0
      :echo 'keep an eye on the vim ♪'
    else
      :echo 'saved! saved! saved!'
    endif
  endif
endfunction

command! MoonChild call <SID>moonchild()

function! s:moonchild()
  let status = get(b:, 'moonchild', 0)
  let b:moonchild = status ? 0 : 1
  echo b:moonchild ? 'escape start!' : 'be caught ...'
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
