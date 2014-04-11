" textobj-punctuation: a text object from the cursor to punctuation
" Author: Anton Beloglazov
" Version: 0.1.0


if exists('g:loaded_textobj_punctuation')
    finish
endif


call textobj#user#plugin('punctuation', {
    \ '-': {
    \     '*sfile*': expand('<sfile>:p'),
    \     'select-a': 'au',  '*select-a-function*': 's:select_a',
    \     'select-i': 'iu',  '*select-i-function*': 's:select_i',
    \ }})


function! s:select(object_type)
    let start_pos = getpos('.')
    call search('\v[,:;!\.\?]', 'W')
    let end_pos = getpos('.')

    if a:object_type ==? 'i'
        if end_pos[2] == 1
            let end_pos[1] -= 1
            let end_pos[2] = strlen(getline(end_pos[1])) + 1
        else
            let end_pos[2] -= 1
        endif
    endif

    return ['v', start_pos, end_pos]
endfunction


function! s:select_a()
    return s:select('a')
endfunction


function! s:select_i()
    return s:select('i')
endfunction


let g:loaded_textobj_punctuation = 1
