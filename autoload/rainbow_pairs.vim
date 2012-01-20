"==============================================================================
"  Description: Rainbow colors for pairs, based on rainbow_parenthsis.vim
"               by Martin Krischik and others.
"               2011-10-12: Use less code.  Leave room for deeper levels.
"==============================================================================
"  GetLatestVimScripts: 3772 1 :AutoInstall: rainbow_parentheses.zip

"==============================================================================
" Rainbow Pairs for Vim by Phize, based on above Rainbow Parentheses.
"
" https://github.com/Phize/vim-rainbow_pairs
"==============================================================================

let s:save_cpo = &cpo
set cpo&vim

" Default token pairs. {{{
if !exists('g:rainbow_pairs_token_pairs')
    let s:token_pairs = [
                    \ ['/(/',  '/)/'],
                    \ ['/\[/', '/\]/'],
                    \ ['/{/',  '/}/'],
                    \ ['/</',  '/>/']
                \ ]
else
    let s:token_pairs = g:rainbow_pairs_token_pairs
endif
" }}}

" Default color pairs. {{{
if !exists('g:rainbow_pairs_color_pairs')
    let s:color_pairs = [
                    \ ['red',         'firebrick3'],
                    \ ['brown',       'RoyalBlue3'],
                    \ ['Darkblue',    'SeaGreen3'],
                    \ ['darkgray',    'DarkOrchid3'],
                    \ ['darkgreen',   'firebrick3'],
                    \ ['darkcyan',    'RoyalBlue3'],
                    \ ['darkred',     'SeaGreen3'],
                    \ ['darkmagenta', 'DarkOrchid3'],
                    \ ['brown',       'firebrick3'],
                    \ ['gray',        'RoyalBlue3'],
                    \ ['black',       'SeaGreen3'],
                    \ ['darkmagenta', 'DarkOrchid3'],
                    \ ['Darkblue',    'firebrick3'],
                    \ ['darkgreen',   'RoyalBlue3'],
                    \ ['darkcyan',    'SeaGreen3'],
                    \ ['darkred',     'DarkOrchid3']
                \ ]
else
    let s:color_pairs = g:rainbow_pairs_color_pairs
endif
let s:color_pairs = reverse(s:color_pairs)
" }}}

" Default max nesting level. {{{
if !exists('g:rainbow_pairs_max')
    let s:max = len(s:color_pairs)
else
    let s:max = g:rainbow_pairs_max
endif
" }}}

" Extend color pairs list. {{{
function! s:extend()
    if s:max > len(s:color_pairs)
        call extend(s:color_pairs, s:color_pairs)
        call s:extend()
    elseif s:max < len(s:color_pairs)
        call remove(s:color_pairs, s:max, -1)
    endif
endfunction " }}}
call s:extend()

" Define cluster for highlighting. {{{
function! s:cluster()
    let levels = ''

    for each in range(1, s:max)
        let levels .= ',level' . each
    endfor

    execute 'syntax cluster rainbow_pairs contains=@TOP' . levels . ',NoInPairs'
endfunction " }}}
cal s:cluster()

" Define regions for highlighting. {{{
function! rainbow_pairs#load()
    for token_pair in s:token_pairs
        let [level, group, all_levels] = ['', '', []]

        for each in range(1, s:max)
            call add(all_levels, 'level' . each)
        endfor

        for each in range(1, s:max)
            let region = 'level' . each
            let group = 'level' . each . 'c'
            let command = 'syntax region %s matchgroup=%s start=%s end=%s contains=TOP,%s,NoInPairs'
            execute printf(command, region, group, token_pair[0], token_pair[1], join(all_levels, ','))
            call remove(all_levels, 0)
        endfor
    endfor
endfunction " }}}

" Highlight token pairs. {{{
function! rainbow_pairs#highlight()
    let id = 1

    for [ctermfg, guifg] in s:color_pairs
        execute 'highlight default level' . id . 'c ctermfg=' . ctermfg . ' guifg=' . guifg
        let id += 1
    endfor
endfunction " }}}

" Enable highlighting. {{{
function! rainbow_pairs#enable()
    if !exists('s:enabled')
        call rainbow_pairs#load()
    endif

    call rainbow_pairs#highlight()

    let s:enabled = 1
endfunction " }}}

" Toggle highlighting. {{{
function! rainbow_pairs#toggle()
    if exists('s:enabled') && s:enabled
        call rainbow_pairs#disable()
    else
        call rainbow_pairs#enable()
    endif
endfunction " }}}

" Update highlighting. {{{
function! rainbow_pairs#update()
    call rainbow_pairs#load()

    if exists('s:enabled') && s:enabled
        call rainbow_pairs#enable()
    endif
endfunction " }}}

" Disable highlighting. {{{
function! rainbow_pairs#disable() " {{{
    for each in range(1, s:max)
        execute 'highlight clear level' . each . 'c'
    endfor

    let s:enabled = 0
endfunction " }}}

let &cpo = s:save_cpo

" vim:ts=4:sw=4:sts=4:fdm=marker:fmr={{{,}}}
