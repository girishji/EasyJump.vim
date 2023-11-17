if !has('vim9script') ||  v:version < 900
    echoe "Needs Vim version 9.0 and above"
    finish
endif
vim9script
g:loaded_easyjump = true

# Jump to any character on screen using 2 characters.

:highlight default link EasyJump MatchParen

import autoload '../autoload/jump.vim'

def Jump()
    jump.Jump()
enddef

def VJump()
    jump.Jump()
    :normal! m'gv``
enddef

:nnoremap <silent> <Plug>EasyjumpJump; :<c-u>call <SID>Jump()<cr>
:onoremap <silent> <Plug>EasyjumpJump; :<c-u>call <SID>Jump()<cr>
:vnoremap <silent> <Plug>EasyjumpJump; :<c-u>call <SID>VJump()<cr>

augroup EasyJump | autocmd!
    autocmd VimEnter * jump.Setup()
augroup END