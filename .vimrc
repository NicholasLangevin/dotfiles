"____    ____  __  .___  ___. .______        ______ 
"\   \  /   / |  | |   \/   | |   _  \      /      |
" \   \/   /  |  | |  \  /  | |  |_)  |    |  ,----'
"  \      /   |  | |  |\/|  | |      /     |  |     
"   \    /    |  | |  |  |  | |  |\  \----.|  `----.
"    \__/     |__| |__|  |__| | _| `._____| \______|"
"
"
" {{{ Plugins Manager
call plug#begin()

Plug 'rhysd/clever-f.vim'                           | " Motion Improvement 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | " Fuzzy Files Finder
Plug 'itchyny/lightline.vim'                        | " Status Bar
Plug 'KeitaNakamura/neodark.vim'                    | " Neodark Theme
Plug 'preservim/nerdtree'                           | " Files Managers
Plug 'ap/vim-buftabline'                            | " Buffer View
Plug 'tpope/vim-commentary'                         | " Comment Block
Plug 'airblade/vim-gitgutter'                       | " Git Blame Myself
Plug 'tpope/vim-fugitive'                           | " Illegal Git Wrapper 
Plug 'samoshkin/vim-mergetool'                      | " Git Mergtool
Plug 'benmills/vimux'                               | " REPL Programming

call plug#end()
" }}}

" {{{ Private Comfiguration
filetype plugin indent on
source ~/.vim/vimrc/color.vim      | " Load colorscheme and status bar
source ~/.vim/vimrc/settings.vim   | " Basics settings
source ~/.vim/vimrc/mappings.vim   | " Mapping
source ~/.vim/vimrc/commands.vim   | " Autocommand
source ~/.vim/vimrc/functions.vim  | " Private function
" }}}
