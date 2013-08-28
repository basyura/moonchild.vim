scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

function! s:escape()
  if get(b:, 'moonchild', 0)
    :w
    let b:moonchild_counter = get(b:, 'moonchild_counter', 0) + 1
    if b:moonchild_counter == 5
      redraw!
      echo '(=ΦωΦ) hum hum hum hum 〜♪'
      let b:moonchild_counter = 0
    else
      let msg = ''
      for v in range(b:moonchild_counter)
        let msg .= 'saved!! '
      endfor
      redraw!
      echo msg
    endif
  endif
endfunction

command! MoonChild call <SID>moonchild()

function! s:moonchild()
  let status = get(b:, 'moonchild', 0)
  let b:moonchild = status ? 0 : 1
  echo b:moonchild ? 'escape start!' : 'be caught ...'

  augroup MoonChild
    autocmd!
    if b:moonchild
      autocmd InsertLeave * :call s:escape()
    endif
  augroup END
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
