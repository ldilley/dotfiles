" .vimrc
" Lloyd Dilley
" https://github.com/ldilley/dotfiles

" Use vim features that are not compatible with vi
set nocp

" Character encoding
set encoding=utf-8

" Show line numbers
set number

" Enable syntax highlighting
syntax enable

" Load language tags for suggestions and autocompletion
set tags+=$HOME/.vim/tags/c.tags
map <C-L> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menuone,menu,longest,preview

" Function to calculate git additions, changes, and deletions (requires vim-gitgutter plugin: https://github.com/airblade/vim-gitgutter)
" Uncomment the function below after installing the gitgutter plugin.
"function! GitStatus()
"  let [a,m,r] = GitGutterGetHunkSummary()
"  return printf('+%d ~%d -%d', a, m, r)
"endfunction

" Update time in ms (default is 4000 or 4 seconds -- a lower value allows gitgutter change updates to appear more quickly and also affects swp file write frequency)
set updatetime=100

" If updatetime is set to a low value, prevent swp writes from occurring
set noswapfile

" Display an informational status bar (requires vim enhanced)
" Uncomment the line below after installing the gitgutter plugin.
"set statusline=[File=%F]%m%r%h%w\ [Format=%{&ff}]\ [Type=%Y]\ [ASCII=\%03.3b(0x\%02.2B)]\ [Row=%l/%L(%p%%)]\ [Column=%v]\ [Offset=%o(0x%O)]\ [Changes=%{GitStatus()}]\ %=[Date=%{strftime(\"%Y-%m-%d\")}]\ [Time=%{strftime(\"%H:%M\")}]
" Comment the line below if using the statusline above that contains gitgutter support.
set statusline=[File=%F]%m%r%h%w\ [Format=%{&ff}]\ [Type=%Y]\ [ASCII=\%03.3b(0x\%02.2B)]\ [Row=%l/%L(%p%%)]\ [Column=%v]\ [Offset=%o(0x%O)]\ %=[Date=%{strftime(\"%Y-%m-%d\")}]\ [Time=%{strftime(\"%H:%M\")}]
set laststatus=2

" Set status bar colors
highlight StatusLine ctermbg=black ctermfg=yellow guibg=black guifg=yellow

" Make colors bolder when syntax highlighting is enabled
set background=dark

" Enable search highlighting
set hlsearch

" Number of spaces in a tab 
set tabstop=2

" Number of spaces that represent a level of indentation
set shiftwidth=2

" Tabs become spaces
set expandtab

" Detect file type, load plugin, and indent accordingly 
filetype plugin indent on

" Prevent mouse from selecting line numbers
set mouse=a

" Open a horizontal terminal if uncommented (use screen or tmux instead)
"term

" Open a vertical terminal if uncommented (use screen or tmux instead)
"vert term

" Start in vertical split mode if uncommented
"au VimEnter * vsplit

" Show added/changed/removed lines in left column and set colors
set signcolumn=yes
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
highlight! link SignColumn LineNr
