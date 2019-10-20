" ==============================================================================
" Integration of jq (the command-line JSON processor) into Vim
" File:         after/ftplugin/json.vim
" Author:       bfrg <https://github.com/bfrg>
" Website:      https://github.com/bfrg/vim-jqplay
" Last Change:  Oct 21, 2019
" License:      Same as Vim itself (see :h license)
" ==============================================================================

let s:cpo_save = &cpoptions
set cpoptions&vim

" Apply a jq filter to the current buffer
" :[range]Jq!  filter the buffer in-place using |:range!| |:!cmd|
" :[range]Jq   redirect the output of jq to a new json buffer
command! -buffer -nargs=1 -range=% -bang -complete=customlist,json#jqplay#complete Jq call json#jqplay#run(<q-mods>, <bang>0, <line1>, <line2>, <q-args>)

" Open a jq scratch buffer with the current buffer as input
command! -buffer -nargs=? -complete=customlist,json#jqplay#complete Jqplay call json#jqplay#scratch(<q-mods>, <q-args>)

" Stop any running jq process, internally calls job_stop()
command! -buffer -nargs=? -complete=custom,json#jqplay#stophow JqStop call json#jqplay#stop(<f-args>)

let b:undo_ftplugin = get(b:, 'undo_ftplugin', 'execute')
        \ . ' | delcommand Jq | delcommand JqStop'
        \ . ' | delcommand Jqplay '

let &cpoptions = s:cpo_save
unlet s:cpo_save
