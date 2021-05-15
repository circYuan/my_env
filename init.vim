set nu

syntax on

" Plugins will be downloaded under the specified directory.
 call plug#begin()

" " Declare the list of plugins.
" Plug 'tpope/vim-sensible'
" Plug 'junegunn/seoul256.vim'
"
Plug 'crusoexia/vim-monokai'
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'preservim/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
" " List ends here. Plugins become visible to Vim after this call.
call plug#end()

set shiftwidth=4

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

colorscheme monokai
let g:NERDTreeWinSize=20

"my habit
nnoremap <leader>ff : LeaderfFunction <CR>
nnoremap ge : GitGutterEnable <CR>
nnoremap gd : GitGutterDisable <CR>
