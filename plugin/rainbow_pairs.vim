"==============================================================================
"  Description: Rainbow colors for parentheses, based on rainbow_parenthsis.vim
"               by Martin Krischik and others.
"==============================================================================

"==============================================================================
" Rainbow Pairs for Vim by Phize, based on above Rainbow Parentheses.
"
" https://github.com/Phize/vim-rainbow_pairs
"==============================================================================

if exists('g:loaded_rainbow_pairs')
    finish
endif

let s:_cpoptions = &cpoptions
set cpoptions-=C

" Auto commands.
if !exists('g:rainbow_pairs_enable_autocmds') || g:rainbow_pairs_enable_autocmds
    augroup rainbow_pairs
        autocmd!
        if !exists('g:rainbow_pairs_enable_on_startup') || g:rainbow_pairs_enable_on_startup
            autocmd VimEnter * call rainbow_pairs#enable()
        endif
        autocmd Syntax,ColorScheme * call rainbow_pairs#update()
    augroup END
endif

" User-defined commands.
command! -nargs=0 RainbowPairsToggle   call rainbow_pairs#toggle()
command! -nargs=0 RainbowPairsEnable   call rainbow_pairs#enable()
command! -nargs=0 RainbowPairsDisable  call rainbow_pairs#disable()
command! -nargs=0 RainbowPairsUpdate   call rainbow_pairs#update()

" Default key mappings.
nnoremap <silent> <Plug>(rainbow_pairs_toggle)  :<C-u>call rainbow_pairs#toggle()<CR>
nnoremap <silent> <Plug>(rainbow_pairs_enable)  :<C-u>call rainbow_pairs#enable()<CR>
nnoremap <silent> <Plug>(rainbow_pairs_disable) :<C-u>call rainbow_pairs#disable()<CR>
nnoremap <silent> <Plug>(rainbow_pairs_update)  :<C-u>call rainbow_pairs#update()<CR>

if !exists('g:rainbow_pairs_enable_key_mappings') || g:rainbow_pairs_enable_key_mappings
    silent! nmap <silent> <unique> <Leader>r <Plug>(rainbow_pairs_toggle)
endif

let &cpoptions = s:_cpoptions

let g:loaded_rainbow_pairs = 1

" vim:ts=4:sw=4:sts=4:fdm=marker:fmr={{{,}}}
