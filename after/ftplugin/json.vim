" ==============================================================================
" Integration of jq (the command-line JSON processor) into Vim
" File:         after/ftplugin/json.vim
" Author:       bfrg <https://github.com/bfrg>
" Website:      https://github.com/bfrg/vim-jqplay
" Last Change:  July 25, 2019
" License:      Same as Vim itself (see :h license)
" ==============================================================================

let s:cpo_save = &cpoptions
set cpoptions&vim

command! -buffer -nargs=1 -range=% -bang -complete=customlist,json#jq#complete Jq call json#jq#run(<q-mods>, <bang>0, <line1>, <line2>, <q-args>)

let &cpoptions = s:cpo_save
unlet s:cpo_save