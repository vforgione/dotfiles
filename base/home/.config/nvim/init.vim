" -----------------------
"   CORE CONFIGURATIONS
" -----------------------

filetype plugin on

set autoindent
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set fileformat=unix
set formatoptions-=cro
set hidden
set mouse=a
set nobackup
set nowritebackup
set number
set pyxversion=3
set shell=/usr/local/bin/zsh
set shortmess+=c
set signcolumn=yes
set smartindent
set smarttab
set syntax=on

" -------------------------
"   CUSTOM CONFIGURATIONS
" -------------------------

" highlight bad whitespace chars with red background
highlight BadWhitespace ctermbg=red guibg=red

" set default tab sizes/spaces
au BufRead,BufNewFile * set tabstop=2
au BufRead,BufNewFile * set shiftwidth=2
au BufRead,BufNewFile * set expandtab

" python specific
augroup ft_py
  au BufRead,BufNewFile *.py,*.pyi set tabstop=4
  au BufRead,BufNewFile *.py,*.pyi set shiftwidth=4
augroup END

" restructured text specific
augroup ft_rst
  au BufRead,BufNewFile *.rst set tabstop=3
  au BufRead,BufNewFile *.rst set shiftwidth=3
augroup END

" golang specific
augroup ft_go
  au BufRead,BufNewFile *.go set noexpandtab
augroup END

" makefile specific
augroup ft_makefile
  au BufRead,BufNewFile Makefile set noexpandtab
augroup END

" ---------------------------
"   NERDTREE CONFIGURATIONS
" ---------------------------

" show dotfiles in nerdtree
let NERDTreeShowHidden = 1

" maps `Ctrl+N` to toggle nerdtree display
map <C-n> :NERDTreeToggle<CR>

" close nerdtree and vim when nt is the only open window
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" use nerd fonts in nerdtree
let g:NERDTreeGitStatusUseNerdFonts = 1

" ----------------------
"   COC CONFIGURATIONS
" ----------------------

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
au CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
