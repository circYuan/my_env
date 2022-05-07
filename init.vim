set nu
set shiftwidth=4

syntax on
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE

augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

augroup filetype
  au! BufRead,BufNewFile *.mlir   set filetype=mlir
augroup END

" Plugins will be downloaded under the specified directory.
 call plug#begin()

" " Declare the list of plugins.
Plug 'crusoexia/vim-monokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
"Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'preservim/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'sindrets/diffview.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'APZelos/blamer.nvim'
Plug 'jamestthompson3/nvim-remote-containers'
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'rhysd/git-messenger.vim'
" " List ends here. Plugins become visible to Vim after this call.
call plug#end()


filetype plugin on

autocmd FileType c,cc,cpp setlocal sw=4 sts=2 ts=4
autocmd FileType javascript setlocal sw=4 sts=2 ts=4


nnoremap <C-t> :NERDTreeToggle<CR>
map <F12> :TagbarToggle<CR>

set expandtab
let g:tagbar_ctags_bin = '~/.local/bin/ctags'
let g:Lf_WindowPosition = 'popup'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:blamer_enabled = 1
let g:blamer_delay = 300

colorscheme monokai
let g:NERDTreeWinSize=20
autocmd vimenter * NERDTree
autocmd vimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"my habit
nnoremap <leader>ff : LeaderfFunction <CR>
nnoremap ge : GitGutterEnable <CR>
nnoremap gd : GitGutterDisable <CR>
nmap <silent> cgd <Plug>(coc-definition)
nnoremap tp : tabprevious <CR>
nnoremap tn : tabNext <CR>
nnoremap ts : tab split <CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

function! s:check_back_space() abort    
  let col = col('.') - 1    
  return !col || getline('.')[col - 1]  =~ '\s'    
endfunction

inoremap <silent><expr> <Tab>    
     \ pumvisible() ? "\<C-n>" :    
     \ <SID>check_back_space() ? "\<Tab>" :    
     \ coc#refresh()
