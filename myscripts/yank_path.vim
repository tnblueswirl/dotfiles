" In order to work, this must be symlinked to
" ~/.dotfiles/.vim/bundle/nerdtree/nerdtree_plugin/yank_path.vim
"
" This symlink is automatically created in ~/.dotfiles/.bash/vim.sh
call NERDTreeAddKeyMap({
        \ 'key': 'yy',
        \ 'callback': 'NERDTreeYankCurrentNode',
        \ 'quickhelpText': 'yank full path to clipboard' })

function! NERDTreeYankCurrentNode()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        " Could also use the double-quote (default) register, instead
        call setreg('*', n.path.str())
    endif
endfunction
