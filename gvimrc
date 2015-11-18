" MacVim GUI mode
if has("gui_macvim")
  set guifont=Hack:h15
  set guioptions=aAce
  set guioptions-=T
  set fuoptions=maxvert,maxhorz
  set noballooneval
  " command option arrow key to switch views
  map <D-M-Up> <C-w>k
  imap <D-M-Up> <Esc> <C-w>k
  map <D-M-Down> <C-w>j
  imap <D-M-Down> <Esc> <C-w>j
  map <D-M-Right> <C-w>l
  imap <D-M-Right> <Esc> <C-w>l
  map <D-M-Left> <C-w>h
  imap <D-M-Left> <Esc> <C-w>h

  " resize current buffer by +/- 5
  nnoremap <M-Right> :vertical resize +5<CR>
  nnoremap <M-Left>  :vertical resize -5<CR>
  nnoremap <M-Up>    :resize -5<CR>
  nnoremap <M-Down>  :resize +5<CR>

  " Automatically resize splits
  " when resizing MacVim window
  autocmd VimResized * wincmd =
endif
