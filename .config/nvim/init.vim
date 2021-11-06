set nocompatible              " be iMproved, required
filetype on                  " required

set number
set smartindent
set laststatus=0

packloadall

let mapleader=","

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

autocmd FileType python call PythonDo()
autocmd FileType c,cpp call CfileDo()
autocmd FileType plaintex,tex call TexDo()
"autocmd BufWinEnter plaintex,tex colorscheme darkblue

au VimEnter *.tex Goyo


"----------------------------Insert mode map keys
"Go to normal mode
inoremap jk <C-[>
"Go to normak mode
inoremap kj <C-[>
"Auto complete
inoremap df <C-n>
"Auto complete omni
inoremap DF <C-x><C-o>
"----------------------------Normal mode map keys
nnoremap <C-F> :Explore<Enter>
nnoremap <C-E>v :args ~/.config/nvim/init.vim<return>
nnoremap <C-E>b :args ~/.bashrc<return>
"remaping zero 
nnoremap 0 ^
nnoremap <leader>a :noh<CR>

"----------------------------buffer navigation
nnoremap <leader>j :bn<CR><C-G>
nnoremap <leader>k :bN<CR><C-G>
nnoremap <leader>l :ls<CR>
nnoremap <leader>l :ls<CR>
nnoremap <leader>g <C-G>
nnoremap <leader>; :ls<CR>:b<space>
nnoremap <leader>o <C-^><C-G>

"---------------------------saving and quiting
nnoremap <leader>s :w<CR>
nnoremap <leader>ww :wqa<CR>
nnoremap <leader>cc :qa!<CR>

"---------------------------for navigation
nnoremap <leader>f *
"nnoremap { {j^
nnoremap } }j^
nnoremap J }j^
nnoremap K {
nnoremap <C-w> <C-y>

"--------------------------for folds
set foldmethod=indent
set foldlevel=99

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

"nnoremap <leader>v :Goyo<CR>

filetype plugin indent on
syntax on
set spelllang=en
set laststatus=0
set path+=**
set noerrorbells
"----------------------------Looks and Feels
hi Folded ctermbg=234
hi StatusLine ctermbg=gray ctermfg=darkgray

"----------------------------Function to activate c, c++ config
function CfileDo()
	ab forpi for(int i = 0; i <; i++){<esc>o}<esc>k02f;i
	ab forpj for(int j = 0; j <; j++){<esc>o}<esc>k02f;i
	ab mainp int main(int argc, char** argv){<esc>o}<esc>k
	ab iostreamp #include <iostream><esc>
	ab stdp using namespace std;<esc>
	ab includep #include <><esc>i
	ab includepq #include ""<esc>i
	ab forp for(){<esc>o}<esc>k0f)
	ab tempc <esc>:r ~/.vim/templates/templatec.cpp <enter>
endfunction

"-----------------------------Function to activate python config
function PythonDo()
	ab mainer if __name__ == "__main__":
	nnoremap <C-y> :!python3 %<CR>
	nnoremap <leader>z /def\\|class<CR>
endfunction

function TexDo()
	setlocal spell spelllang=en_us
	colorscheme darkblue
	setlocal thesaurus+=$HOME/.vim/thesaur/mthesaur.txt
	ab secn \section{}<esc>
	nnoremap <C-y> :w <CR> :!pdflatex %<CR><CR>
	nnoremap ,sk :read $HOME/.vim/skeletons/latex/skeleton.tex<CR>
	nnoremap <C-d> :call OpenInZathura()<CR><CR>
	nnoremap <leader>d dis
	"nnoremap <leader>v :Goyo<CR>
	nnoremap j gj
	nnoremap k gk
	inoremap <leader>; <esc>disa
	nnoremap <C-n> :set nospell
	nnoremap <leader>vg :Goyo<CR>:colorscheme darkblue<CR>
	nnoremap <leader>vv :Limelight!!<CR>
	nnoremap <leader>c :colorscheme darkblue<CR>
endfunction

function! s:goyo_enter()
	colorscheme darkblue
endfunction

function ToggleView()
	limelight!!
	Goyo
	colorscheme darkblue
endfunction

function OpenInZathura()
	let namel = split(@%, '\.')
	let fistName = namel[0]
	"let pdfname = join([namel[0], "pdf"], '.')
	let pdfname = namel[0] . ".pdf"
	":echo pdfname
	exe ':!zathura ' . pdfname . ' &'
endfunction
