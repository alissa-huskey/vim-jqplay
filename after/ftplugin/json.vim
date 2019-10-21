" ==============================================================================
" Run jq (the command-line JSON processor) interactively in Vim
" File:         after/ftplugin/json.vim
" Author:       bfrg <https://github.com/bfrg>
" Website:      https://github.com/bfrg/vim-jqplay
" Last Change:  Oct 21, 2019
" License:      Same as Vim itself (see :h license)
" ==============================================================================

let s:cpo_save = &cpoptions
set cpoptions&vim

" Open a jq scratch buffer with the current buffer as input
command! -buffer -nargs=? -complete=customlist,jqplay#complete Jqplay call jqplay#scratch(<q-mods>, <q-args>)

" Stop any running jq process
command! -buffer -nargs=? -complete=custom,jqplay#stophow Jqstop call jqplay#stop(<f-args>)

let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'execute') . ' | delcommand Jqplay | delcommand Jqstop'

let &cpoptions = s:cpo_save
unlet s:cpo_save
