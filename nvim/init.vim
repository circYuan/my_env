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

augroup filetype
  au! BufRead,BufNewFile *.tex set filetype=tex
augroup END

" Andes coding style
highlight ExtraWhitespace ctermbg=darkred guibg=darkcyan
autocmd BufEnter * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufEnter * if &ft == 'help' | match none /\s\+$/ | endif
au BufWinEnter * let w:long_line_match=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Plugins will be downloaded under the specified directory.
 call plug#begin()

" " Declare the list of plugins.
Plug 'crusoexia/vim-monokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
"Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'preservim/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'sindrets/diffview.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'krady21/compiler-explorer.nvim'
"Plug 'APZelos/blamer.nvim'
"Plug 'jamestthompson3/nvim-remote-containers'
Plug 'tpope/vim-fugitive'
"Plug 'dense-analysis/ale'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'rhysd/git-messenger.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'rhysd/vim-grammarous'
"Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown' }
" " List ends here. Plugins become visible to Vim after this call.
call plug#end()


filetype plugin on

autocmd FileType c,cc,cpp setlocal sw=4 sts=2 ts=4
autocmd FileType javascript setlocal sw=4 sts=2 ts=4

autocmd FileType tex setlocal textwidth=60


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

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"inoremap <silent><expr> <Tab>
     "\ pumvisible() ? "\<C-n>" :
     "\ <SID>check_back_space() ? "\<Tab>" :
     "\ coc#refresh()

" for markdown
let g:mkdp_auto_start = 1
let g:mkdp_open_to_the_world = 1

" clang-format
map <C-K> :pyf /home/users/yuan593/build_src/clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /home/users/yuan593/build_src/clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04/share/clang/clang-format.py<cr>

" ale
"let g:ale_disable_lsp = 1
"let g:airline#extensions#ale#enabled = 1
"let g:ale_linters = {"cpp": 'clangtidy'}
"let g:ale_cpp_clangtidy_checks = ["llvm*"]
