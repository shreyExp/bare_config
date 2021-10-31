set nocompatible              " be iMproved, required
filetype on                  " required

set number
set smartindent

packloadall

let mapleader=" "

autocmd FileType python call PythonDo()
autocmd FileType c,cpp call CfileDo()
autocmd FileType plaintex,tex call TexDo()


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
nnoremap <C-F> :Texplore<Enter>
nnoremap <C-E>v :tabe ~/.vimrc<return>
nnoremap <C-E>b :tabe ~/.bashrc<return>
"remaping zero 
nnoremap 0 ^
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
nnoremap <leader>a :wqa<CR>
nnoremap <leader>cc :qa!<CR>

"---------------------------for navigation
nnoremap <leader>f *
"nnoremap { {j^
nnoremap } }j^
nnoremap <C-w> <C-y>

"--------------------------for folds
set foldmethod=indent
set foldlevel=99

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END


filetype plugin indent on
syntax on
set spelllang=en
"set laststatus=2
set path+=**
set noerrorbells
"----------------------------Looks and Feels
hi Folded ctermbg=234

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
endfunction

function TexDo()
	ab secn \section{}<esc>
	nnoremap <C-y> :w <CR> :!pdflatex %<CR><CR>
	nnoremap ,sk :read $HOME/.vim/skeletons/latex/skeleton.tex<CR>
	nnoremap <C-d> :call OpenInZathura()<CR><CR>
endfunction

function OpenInZathura()
	let namel = split(@%, '\.')
	let fistName = namel[0]
	"let pdfname = join([namel[0], "pdf"], '.')
	let pdfname = namel[0] . ".pdf"
	":echo pdfname
	exe ':!zathura ' . pdfname . ' &'
endfunction
