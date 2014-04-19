if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins with NeoBundle
" From VimScripts
" GitHub
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'

function! SetDefaultSettings()
	syntax enable syntax on
	set ts=2
	set shiftwidth=2
	set ai
	set wm=1
	" No visual or auditory bell
	set vb t_vb=
	set printoptions=paper:letter
	" Use when using dark terminal:
	" set background=dark
	set showmatch
	set matchtime=1
	" Don't wrap text--want to see where real line breaks are
	" set nowrap
	"
	set laststatus=1                  " Statusbar
	set showtabline=1                 " Show the tab bar
	set foldcolumn=0                  " No left margin
	highlight! link FoldColumn Normal " Make it the background colour
	set guioptions+=r 								" Remove right scroll bar
endfunction

call SetDefaultSettings()
command SetDefaultSettings call SetDefaultSettings()

autocmd BufRead *.lsp,*.lisp so ~/lib/VIlisp.vim
au BufRead,BufNewFile *.scss set filetype=scss

" Enable filetype-specific indenting and plugins
filetype plugin indent on

" Load matchit so that % bounces from do to end, etc.
runtime! macros/matchit.vim

" Perl programming:
" Have things in braces indenting themselves:
autocmd FileType perl set smartindent
" Set compile cmd for perl
autocmd FileType perl set makeprg=perl\ -c\ %

" PHP programming:
" Have things in braces indenting themselves:
autocmd FileType php set smartindent
autocmd FileType php set makeprg=php\ -l\ %

" Text File Abbreviations
autocmd BufRead,BufNewFile *.txt		setfiletype text
autocmd FileType text	ab ee (E)
autocmd FileType text	ab ww (W)
autocmd FileType text	ab pp (P)
autocmd FileType text	ab ## (#)
autocmd FileType text	ab >> (>)
autocmd FileType text	ab hh (H)
autocmd FileType text	ab xx (X)
autocmd FileType text	ab %% (%)
set formatoptions=ln
set lbr

function! ZenWriter()
	highlight NonText guifg=bg				" Match the tildes to your background
	set laststatus=0                  " No statusbar
	set nonumber                      " No line numbering
	set showtabline=0                 " don't show the tab bar
	set foldcolumn=4                  " Add a left margin
	highlight! link FoldColumn Normal " Make it the background colour
	set wrapmargin=8                  " Add a right margin, sort of
	set guioptions-=r 								" Remove right scroll bar
endfunction

command ZenWriter call ZenWriter()

" VimRoom options
" Why is this not working? -- Byron
" set g:vimroom_background=black		" the background color to be used for hiding elements
" set g:vimroom_min_sidebar_width=4	" the minimum sidebar width. This will automatically expand to take up all the free space left
" set g:vimroom_navigational_keys=0	" determines whether Vimroom will map <Up>/<Down>/j/k/etc. to navigate over “display” lines
" " set g:vimroom_scrolloff specifies how many lines of text ought appear before and after the cursor. This defaults to 999, which centers the cursor on the screen.
" set g:vimroom_sidebar_height=2		" sets the height of the upper and lower “sidebars.” If you don’t want vertical padding, set to 0.
" set g:vimroom_width=80 						" is the width of your workspace.
