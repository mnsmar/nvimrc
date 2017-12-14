"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""          vim-plug            """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" general
Plug 'tpope/vim-fugitive'               " git integration
Plug 'tpope/vim-unimpaired'             " unimpaired Vim
Plug 'tpope/vim-repeat'                 " make . work for plugins
Plug 'Lokaltog/vim-easymotion'          " navigate in files
Plug 'godlygeek/tabular'                " align text on pattern
Plug 'tomtom/tcomment_vim'              " comment source code
Plug 'DataWraith/auto_mkdir'            " create parent dirs on save
Plug 'scrooloose/syntastic'             " check syntax
Plug 'danro/rename.vim'                 " rename buffer and file on disk
Plug 'bling/vim-airline'                " improved status line
Plug 'vim-airline/vim-airline-themes'   " improved status line themes
Plug 'wesQ3/vim-windowswap'             " swap windows with <leader>ww
Plug 'jtratner/vim-flavored-markdown'   " markdown support
Plug 'ctrlpvim/ctrlp.vim'               " buffer and file explorer
Plug 'chrisbra/Recover.vim'             " smart recovery of *.swp files
Plug 'ConradIrwin/vim-bracketed-paste'  " transparent pasting (no :set paste!)

" colors
Plug 'altercation/vim-colors-solarized'

" plugins for autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" plugins for tmux integration
Plug 'christoomey/vim-tmux-navigator'   " navigate between vim and tmux
Plug 'benmills/vimux' | Plug 'benmills/vimux-golang' " run go tests in tmux

" plugins for Go
Plug 'fatih/vim-go'

" plugins for Python
Plug 'davidhalter/jedi-vim' " enable Python autocompletion
Plug 'zchee/deoplete-jedi'

" Add plugins to &runtimepath
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""           Init             """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""           Colors             """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""           Settings             """"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden           " hide buffer, don't close
set guioptions-=T    " remove toolbar
set guioptions-=r    " remove right-hand scroll bar
set guioptions-=L    " remove left-hand scroll bar
set tabstop=4        " size of a hard tabstop
set shiftwidth=4     " size of an indent
set softtabstop=4    " spaces+tabs used to simulate tabs for width != tabstop
set updatetime=200   " how long before Perl variables are highlighted
set wildmode=longest,list " make autocompetion in command mode like bash
set wildmenu              " required for the above
set history=10000
set cmdheight=2      " change the height of the command
set autoindent       " enable auto indent
set copyindent       " copy indentation from previous line
set smartcase        " ignore case for lowercase search, case otherwise
set hlsearch         " highlight search terms
set undolevels=2000  " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title            " change the terminal's title
set visualbell       " don't beep
set noerrorbells     " don't beep
set whichwrap+=<,h   " go to wrapped line
set whichwrap+=>,l   " go to wrapped line
set mouse=a          " enable mouse
set scrolloff=4      " always have some lines of context
set laststatus=2     " always have a status bar
set textwidth=78     " enable text wrapping
set colorcolumn=+1   " highlight column after textwidth
set formatoptions-=t " stop wrap with newlines
set ssop-=options    " do not store global and local values in session
set ssop-=folds      " do not store folds in session
set listchars=tab:▸\ ,eol:¬ " Symbols for tabstops and EOLs
set backspace=2      " more powerful backspacing
set completeopt-=preview " disable preview buffer with omnicomplete
set spell spelllang=en " enable spelling for english
set clipboard+=unnamedplus "always use the clipboard
"set guicursor=       "fix for Konsole https://github.com/neovim/neovim/issues/6403

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""           Maps             """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" simple but powerful - use ; instead of <S-:>
noremap ; :
" replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" for wrapped lines -> jump to next row instead of next line
nnoremap j gj
nnoremap k gk
" clean search highlighting
nmap <silent> ,/ :nohlsearch<CR>
" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv
" close buffer without closing window
nnoremap <leader>c :bp\|bd #<CR>
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Press F5 to insert date in insert and normal mode
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""         Terminal Maps            """""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" to map <Esc> to exit terminal-mode
:tnoremap <Esc> <C-\><C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""           Easymotion             """""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1  " Turn on case sensitive feature
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" Bi-directional find motion
nmap s <Plug>(easymotion-s)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""           Syntastic             """""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_enable_balloons=1
let g:syntastic_always_populate_loc_list=0
let g:syntastic_echo_current_error=0
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_aggregate_errors=1
let g:syntastic_id_checkers=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers=['perl', 'perlcritic']
let g:syntastic_go_checkers = ['go']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""           Vim-flavored-markdown             """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup markdown
	au!
	au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
aug	 END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""           CtrlP             """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<,-p>'
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>F :CtrlPCurFile<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 40
let g:ctrlp_open_multiple_files = '2vjr' " max 2 splits all others hidden
let g:ctrlp_follow_symlinks = 1          " follow but avoid loops
let g:ctrlp_open_new_file = 'r'          " open new file in current window

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""           vimux-golang             """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>ra :wa<CR> :GolangTestCurrentPackage<CR>
map <Leader>rf :wa<CR> :GolangTestFocused<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""              vim-go               """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>tc <Plug>(go-coverage)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_jump_to_error = 0 "avoid empty buffer for go-test (Issue #367)
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_auto_type_info = 1
let g:go_template_autocreate = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""            ultisnips              """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-j>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""            deoplete               """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 40
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""            jedi-vim               """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#max_doc_height = 15
