" .vimrc

" Show line numbers
set number

" Display a nice status bar
" This requires vim enhanced
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" A tab is equal to *this* many spaces
set tabstop=2

" Tabs become spaces
set expandtab

" Start in vertical split mode if uncommented
"au VimEnter * vsplit
