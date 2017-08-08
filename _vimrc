source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

colorscheme badwolf " color schemes
syntax enable " enable syntax processing
set number " adds line numbers
highlight LineNr ctermfg=darkgray " line numbers 
set tabstop=4 " number of spaces in a tab
set softtabstop=4 "number of spaces in a tab when editing
set expandtab " tabs are now converted to spaces
set showcmd " show command in the bottom bar
set showmatch " highlight matching parenthesis
set incsearch " re-searches as characters are typed
set hlsearch " highlights all search terms
nnoremap <leader><space> :nohlsearch<CR>
nnoremap j gj " moves logically down even if lines are wrapped
nnoremap k gk " moves logically up even if lines are wrapped
nnoremap B ^ " B will jump you to the beginning of the line
nnoremap E $ " E will jump you to the end of the line
let mapleader="," " sets comma instead of backslash for key sequences
inoremap jk <esc> " remaps jk (unused keys unless you're typing "Dijkstra") to escape
set mouse=a " should allow usage of the mouse




 

set diffexpr=MyDiff()
function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        if $VIMRUNTIME =~ ' '
                if &sh =~ '\<cmd'
                        if empty(&shellxquote)
                                let l:shxq_sav = ''
                                set shellxquote&
                        endif
                        let cmd = '"' . $VIMRUNTIME . '\diff"'
                else
                        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
                endif
        else
                let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
        if exists('l:shxq_sav')
                let &shellxquote=l:shxq_sav
        endif
endfunction

