set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
nnoremap <silent><leader>x :put =trim(execute(input(':', '', 'command')))<CR>
set number
"set mouse=a
setlocal spell
set spelllang=en_us,cjk
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
set ignorecase
set autoindent
set tabstop=4
set shiftwidth=4
set history=1000
set clipboard=unnamedplus
" Pathogen load
filetype off
filetype plugin indent on
syntax on
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> gj j
noremap <silent> gk k

let g:python3_host_prog='/usr/local/anaconda3/bin/python3'
"let g:pymode_lint_select = "e501,w0011,w430"
""""""""""""""""""""""
    "Quickly Run
    """"""""""""""""""""""
    map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!time python3.8 %"
        elseif &filetype == 'html'
            exec "!firefox % &"
        elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
	endfunc

inoremap vv <esc>" 映射插入模式下的 jk 键为 ESC 键
cnoremap vv <esc>

call plug#begin('d:/plugged')
Plug '907th/vim-auto-save'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
call plug#end()
nmap <leader>p :PymodeLintAuto<cr>
nmap ,v :nerdtreefind<cr>
nmap ,g :NERDTreeToggle<cr>
"=========ctrlp====
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"=========ctrlp====
"=========auto save=====
let g:auto_save = 1 
" enable AutoSave on Vim startup


function! ChineseCount() range
	let save = @z
	silent exec 'normal! gv"zy'
	let text = @z
	let @z = save
	silent exec 'normal! gv'
	let cc = 0
	for char in split(text, '\zs')
		if char2nr(char) >= 0x2000
			let cc += 1
		endif
	endfor
	echo "Count of Chinese charasters is:"
	echo cc
endfunc
noremap <F2> :call ChineseCount()<cr>

colorscheme desert
"=======plug conifg=======
function! GetPlugNameFronCurrentLine(cmd)
    let plugin_name = getline(".")

    if plugin_name !~ "^Plug"
        execute(a:cmd . '!')
        return
    endif

	let plugin_name = split(split(plugin_name, "'")[1], '/')[-1]
	let plugin_name = substitute(plugin_name, '\.git$', '', 'g')
	execute(a:cmd .' '. plugin_name)
endfunction
nmap ,pi :w<cr>:call GetPlugNameFronCurrentLine('PlugInstall')<cr>
nmap ,pu :call GetPlugNameFronCurrentLine('PlugUpdate')<cr>
nmap ,pui :call GetPlugNameFronCurrentLine('PlugClean')<cr>
"=======plug conifg=======

"""""""""""""""""
"  easy motion  "
"""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to word
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion



