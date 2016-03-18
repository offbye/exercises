"=============================================================
" set nowrap  " set wrap   "禁止自动换行/启用自动换行  有时候不自动换行看起来更清楚一些
set cindent
"  参考 :help cinoptions-values
" :1  设置c 缩进风格， switch的case 语句相对switch语句的缩进为1
" l1  设置c 缩进风格， switch的case 里面的语句把case 作为对齐标准，而不是跟上一句语句对齐
" =0  设置c 缩进风格， switch的case 里面的语句按照case 缩进的距离，
" g1 设置c++类的"pubic"，"private" ，"protected" 声明的 缩进为1
" N-s 设置c++ namespace的缩进为0
set cino=:1,l1,g1,N-s

set number
set tabstop=2     " 一个tab宽度为2
set expandtab     " 把tab自动切换为空格
" set noexpandtab   " 不自动替换tab
set softtabstop=2 " backspace删除时，自动根据tabstop的值删除个空格
set shiftwidth=2  " cindent缩进
syntax on
set cursorline "突出显示当前行 set nocursorline
set autochdir " 自动切换当前目录为当前文件所在的目录
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim负责保存
set ignorecase " 忽略大小写
set smartcase " 如果搜索包含大写字母，那还是不忽略大小写
set hlsearch " 搜索时，高亮显示搜索到的单词
set foldmethod=syntax  " 设置折叠的方法
set foldnestmax=3      " 设置最大折叠深度
set nofoldenable       " 打开文件时默认不要折叠
set exrc  "设置vim加载所有目录下.vimrc文件，这样每个工程目录就可以有自己的自定义设置了。
set secure  "限制上一步设置里面的目录下的vimrc不能使用某些不安全的命令
set nobackup " 不要备份文件

" vim 7.3开始设置这个highlight long line，不过下面那个好像更好看
" 设置 ColorColumn的颜色 highlight ColorColumn ctermbg=7 guibg=Black
" http://vim.wikia.com/wiki/VimTip810
" 超过80长度的字符采用红色背景，这个比， set colorcolum=80 要好看点。
" /\%81v.\+/这个正则表达式匹配大于80个字符的，还可以用范围 /\%<81v.\%>77v/
" 或者只高亮第81个字符 /\%80v./
" match ErrorMsg '\%>80v.\+' 这个直接用内置ErrorMsg红色字体
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength   /\%81v.\+/
set colorcolumn=80

" vim搜索c的+include文件的路径，比如下面 [I   gf 命令等需要打开头文件的时候，就要根据这个path变量去搜索了。
" set path=""

" 设置编码, 参考 正确设置 Vim 的字符编码选项 http://rainux.org/vim-gvimvim-on-win32
"set encoding=utf-8  "这个设置了之后，在windows 平台会导致界面提示消息等乱码
                     " 但如果打开文件之后在用:set encoding=utf-8 设置就不会影响界面
                     " 好像会在文件结尾加上编码标志，只是gvim内部使用的?
                     " 我看有问题再设置这个选项好了
" set nobomb       可以删除UTF-8 文件开始的几个BOM 文件编码标识的字节。
                  " windows的记事本默认设置BOM，可以用vim打开，执行这个之后再
                  " :wq 保存就可以删掉了
set fileencoding=utf-8
set fileencodings=utf-8,gbk
" 上面的设置可以直接执行也可以放到vimrc文件里面去，以便每次启动时有效。可以下面这个加到vimrc方便使用
"  编码设置相关设置的说明： 来自 http://wensuper.iteye.com/blog/1495384
"        encoding（enc）：encoding是Vim的内部使用编码，encoding的设置会影响Vim内部的Buffer、消息文字等。在Unix环境下，encoding的默认设置等于locale；Windows环境下会和当前代码页相同。在中文Windows环境下encoding的默认设置是cp936（GBK）。
"         fileencodings：Vim在打开文件时会根据fileencodings选项来识别文件编码，fileencodings可以同时设置多个编码，Vim会根据设置的顺序来猜测所打开文件的编码。
"         fileencoding ：Vim在保存新建文件时会根据fileencoding的设置编码来保存。如果是打开已有文件，Vim会根据打开文件时所识别的编码来保存，除非在保存时重新设置fileencoding。
" termencodings（tenc）：在终端环境下使用Vim时，通过termencoding项来告诉Vim终端所使用的编码。
"         termencodings：在终端环境下使用Vim时，通过termencoding项来告诉Vim终端所使用的编码。
" |:help encoding-values|列出Vim支持的所有编码。

" 设置语法主题
" monokai主题不支持字符终端，在xshell里面需要事先用gui2term.py
" 处理一下，转换成成支持字符终端的主题
" gui2term.py http://www.vim.org/scripts/script.php?script_id=2778
" 或者 guicolorscheme " 之类的插件来辅助转换一下，
" 不然设置这个主题，颜色效果出不来。参考下面set  t_Co=256的说明
" colorscheme monokai   " sublime text 编辑器风格
" colorscheme flatland
colorscheme molokai   " 基于 monokai的修改的主题，比monokai背景要好看一些。


" 格式化代码块
noremap <leader>a =ip

" 切换paste 模式
set pastetoggle=<leader>z

" 保存文件快捷键
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
" 避免windows 10 里面 tagbar 插件侧边栏显示 tooltip 气球提示时gvim崩溃的bug
set noballooneval   " vimrc比插件早加载，后面那些插件里面又打开了，导致设置无效。进入界面再手工设置就可以。用autocmd 设置延时执行？
set balloondelay=10000000  " 设置一个超长停留时间，鼠标停10000秒才显示 ballon tooltip， 插件里面不改这个，这样基本就禁止tooltip功能了



" 在 xshell或者一个非GUI的字符终端里面，设置这个颜色为 25 color 显示更清楚
" 但要字符终端支持256色才能这么设置，参考下面网站的说明
" Using GUI color settings in a terminal
" http://vim.wikia.com/wiki/Using_GUI_color_settings_in_a_terminal
" 强烈推荐–将GUI配色转化为终端配色的VIM插件–gui2term.py
" http://www.vimer.cn/2010/03/%E5%BC%BA%E7%83%88%E6%8E%A8%E8%8D%90-%E5%B0%86gui%E9%85%8D%E8%89%B2%E8%BD%AC%E5%8C%96%E4%B8%BA%E7%BB%88%E7%AB%AF%E9%85%8D%E8%89%B2%E7%9A%84vim%E6%8F%92%E4%BB%B6-gui2term-py.html
" 让vim在终端下的配色亮起来！
" http://www.vimer.cn/2010/02/%E8%AE%A9vim%E5%9C%A8%E7%BB%88%E7%AB%AF%E4%B8%8B%E7%9A%84%E9%85%8D%E8%89%B2%E4%BA%AE%E8%B5%B7%E6%9D%A5%EF%BC%81.html
if has("gui_running")
else
	set t_Co=256 " 在不是GUI的终端里面，如果像xshell这样的支持256色的话就把这一句注释掉
endif

" 编程字体
" ========
if has("gui_running")
    if has("win32")
        " 设定 windows 下 gvim 启动时最大化
        autocmd GUIEnter * simalt ~x
        " 设定 windows 下图形界面下的字体。该字体需要自己下载安装，下载地址：
        "好像程序员比较喜欢的字体有
        "1. Bitstream Vera Sans Mono
        "http://www-old.gnome.org/fonts/
        "http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/
        "2. 微软visual stuido 自带的 Consolas字体
        "http://www.microsoft.com/en-us/download/details.aspx?id=17879
        " 下载安装完，gvim的菜单里面又有了Consolas 字体，可以用下面这个设置
        "  set guifont=Consolas:h12:cANSI
        "  Bitstream_Vera_Sans_Mono在默认的 gvim菜单里面有这个，
        "下面这个设置字体大小为12
        "set guifont=Bitstream_Vera_Sans_Mono:h14:cANSI
        set guifont=Source_Code_Pro:h14:cANSI
    else
        " 设定 linux 下图形界面下的字体，该字体 Fedora 7 自带
       " set guifont=DejaVu\ LGC\ Sans\ Mono\ 14

	   " debian上面，把字体下载回来放到
	   " /usr/share/fonts/truetype/目录去就可以了
	   " 在gvim (apt-get install vim-gtk) 里面可以也可以用这个字体
	   " set guifont=Bitstream\ Vera\ Sans\ Mono\ 14
     set guifont=Source_Code_Pro:h14:cANSI
    endif
endif

" 记录文件最后一次打开时光标所在的位置
 autocmd BufReadPost *
\ if line("'\"")>0&&line("'\"")<=line("$") |
\exe "normal g'\"" |
\ endif

" grep相关的配置
" ==============
" :nmap <F5> :cw<cr>
" :nmap <F4> :cclose<cr>
:nmap <F5> :cn<cr>
:nmap <F6> :cp<cr>
"把 f3 按键映射为在本目录下文件里面搜索光标下面的单词
if has("win32")
	" grep的设置
	:set grepprg=c:/git/usr/bin/grep.exe\ -n
	"windows平台用这个
	:nmap <F3> "*yw<cr>:grep <c-v> ./*<cr><esc>:cw<cr>
else
	" linux 平台用这个
	:nnoremap <F3> :grep <C-R><C-W> *<CR><esc>:cw<cr>
endif

" 弹出和隐藏quickfix窗口
" =======================
" 来自http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
function! QFixToggle()
  if exists("g:qfix_win")
    cclose
    unlet g:qfix_win
  else
    " copen 10
	cw
    let g:qfix_win = bufnr("$")
  endif
endfunction
let g:qfix_win = 1
nmap <script> <silent> <F4> :call QFixToggle()<CR>

"  隐藏菜单和工具栏，按F1才显示 Toggle Menu and Toolbar
"  ============================
set guioptions-=m
set guioptions-=T
map <silent> <F1> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions +=T <Bar>
        \set guioptions +=m <Bar>
    \endif<CR>


" 编程风格，高亮和去掉行尾的空格
" ==============================
" 这个要放到上面的go语言插件的后面才起作用，go那里好像重设置语法了
" 高亮显示行尾的空格，和空格和TAB键混用的情况
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
" ctermbg 必须用颜色名字，guibg可以用颜色值
highlight default ExtraWhitespace ctermbg=red guibg=#F92672
match ExtraWhitespace /\s\+$\| \+\t/
" 可以用下面这个删掉所有的行尾空格
" %s/\s\+$//
" 或者像下面这个map <leader>w git stripspace命令，来删掉这个 whitespace error
" 默认的<leader>键是 “\ ” 有的是逗号",”
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" delete all trailing whitespace in current file
if has ("win32")
	map <leader>w :call Preserve(":%!c:/git/bin/git.exe stripspace")<CR>
else
	map <leader>w :call Preserve(":%!git stripspace")<CR>
endif











" 管理 插件的插件
" =======================================
" https://github.com/tpope/vim-pathogen
"
"  Install to ~/.vim/autoload/pathogen.vim. Or copy and paste:
"      mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"  If you're using Windows, change all occurrences of ~/.vim to ~\vimfiles."
"
"  安装好pathogen 插件后， 其他所有的插件用 git clone 下载到
"  linux系统的 ~/.vim/bundle 目录下就可以了
"  如果是windows 平台就是vim安装目录的 vimfiles/bundle 目录
"  比如
"    cd ~/.vim/bundle
"    git clone https://github.com/terryma/vim-multiple-cursors
execute pathogen#infect()


" Google C++ 代码风格
" ==================
" 1.  google 的c++ 代码风格检查 cpplint 工具，按 <F7> 检查 google 风格
" git clone https://github.com/google/styleguide/tree/gh-pages/cpplint
" https://github.com/funorpain/vim-cpplint
"
" 2.安装windows 版本的clang
" apt-get install clang
" apt-get install clang-format-3.5
"
" 选中要格式化的行，然后按 <ctrl> + k  自动调用 clang-format 格式化文件为google的c++ 代码风格。
" clang-format 使用的例子
"   C:\Program Files (x86)\LLVM\bin\clang-format.exe  -style=Google  -sort-includes d:/log_stream.cpp
" clang-format 通过--style参数指定要格式化为的格式
" 在源码目录里面放名字为 '.clang-format' or '_clang-format'
" 文件，里面写Google应该就可以了。 不过我是直接修改 clang-format.py<里面的
" style = 'file'  为 style = 'Google'
" # Change this to format according to other formatting styles. See the output of
" # 'clang-format --help' for a list of supported styles. The default looks for
" # a '.clang-format' or '_clang-format' file to indicate the style that should be
" # used.
" style = 'file'
" gvim.exe是32位的，python也要安装32位的
" 最新的gvim 会动态加载python27.dll 模块，可以 :version 查看编译选项是否
" 支持python。 发现安装最新的python2.7.11版，gvim程序执行python命令会导致
" 程序崩溃， 安装 2.7.10可以正常工作
if has("win32")
  let g:clang_format_path = "C:\\Program Files\\LLVM\\bin\\clang-format.exe"
  map <C-K> :pyfile C:\Program\ Files\LLVM\share\clang\clang-format.py<cr>
  " imap <C-K> <c-o>:pyf <path-to-this-file>/clang-format.py<cr>
else
  let g:clang_format_path = "/usr/bin/clang-format-3.5"
  map <C-K> :pyfile /usr/share/vim/addons/syntax/clang-format-3.5.py<cr>

endif


" vim-multiple-cursors插件 “True Sublime Text style multiple selections for Vim”
" ========================
" git clone https://github.com/terryma/vim-multiple-cursors


" commentary.vim 快捷注释代码插件
" ===============================
" git clone https://github.com/tpope/vim-commentary
" 映射为空格键注释代码
:nmap <space> gcc
:vmap <space> gc

" 添加commentary注释插件的 cmake文件的注释模式
autocmd FileType cmake set commentstring=#\ %s
autocmd FileType gnuplot set commentstring=#\ %s
autocmd FileType cpp set commentstring=//\ %s
au BufNewFile,BufRead *.sam set filetype=tcl


" vim-expand-region 自动扩展选择区域的插件
" =====================================
" git clone https://github.com/terryma/vim-expand-region
" 自动扩大选择区域的插件，让它只在visual 模式才使用+  _键盘映射
vmap + <Plug>(expand_region_expand)
vmap _ <Plug>(expand_region_shrink


" nerdtree 文件夹目录浏览树
" =========================
" git clone https://github.com/scrooloose/nerdtree
" 把F2映射为显示左侧目录浏览树窗口开关
map <F2> :NERDTreeToggle<CR>


" Buffer Explorer 插件,可以辅助buf的选择
" ==================================
" git clone https://github.com/jlanzarotta/bufexplorer
" 安装完 输入 :BufExplorer  , 就会弹出一个包含所有buffer列表的窗口供选择。
" 用鼠标或者键盘都可以跳转的到对应的buffer去。
" 或者在normal模式直接输入下面这个斜杠开始的命令，都可以打开bufexplorer的窗口。
"   '\be' (normal open)  or
"   '\bs' (force horizontal split open)  or
"   '\bv' (force vertical split open)
"可以把f9映射为这个buffer浏览的快捷键。
noremap <silent> <F9> :BufExplorer<CR>
nmap <F10> :bn<CR>
nmap <F11> :bp<CR>


" 加载 go 语言的插件
" ==================
" git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
" 在golang里面编译安装 https://github.com/jstemmer/gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" tabular 对齐插件
"=======================
" git clone https://github.com/godlygeek/tabular
" 自动对齐插件， 比如可以先用v模式选中几个要对齐的等号赋值语句，
" 然后输入 :Tab /=  就可以多条赋值语句按照等号对齐了
" 后面的写法支持正则表达式的的。
" 比如    :Tab /\S\+   可以对齐结构元素定义
" 比如    :Tab /\w*;   可以对齐结构元素定义
" \S 匹配非空字符。  更多的正则表达式可以  :help pattern-atoms  查看帮组
" 对齐c++注释   :Tab /\/\/


" Tagbar 对c++ 的支持比 Taglist 更好
" ====================================
" git clone https://github.com/majutsushi/tagbar
let Tlist_Use_Right_Window = 1   " 显示在右边窗格
 " nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>


" surround  插件
" ==============
" git clone https://github.com/tpope/vim-surround
" 可以快熟替换字符串两边两边的引号或者括号匹配对
" 常用命令  替换cs'"  删除ds' 整行添加yss)  添加ysiw[  等


" easymotion 插件
" =============
" git clone  https://github.com/Lokaltog/vim-easymotion
" 快速移动插件，两次leader键 \\ +  移动命令，就会把所有的位置用字母表示并高亮起来。
" 然后再敲对应的高亮的字母就快速移动到对应位置。
" 比如  \\w  \\f + 查找的字母  \\e   \\t 等
" 其他的还有多字符匹配等，不过比较复杂。


" vim-textobj-user 插件
" =====================
" git clone https://github.com/kana/vim-textobj-user
" 允许自定义text block块，类似 vi{   vip  vａ(  等自定义块


" 高亮  c/c++ 的函数名和类名
" ===========================
" git clone https://github.com/octol/vim-cpp-enhanced-highlight
" windows 默认不加载 vim74/after/syntax 目录的脚本，需要配置一下
set runtimepath+=$VIMRUNTIME/after


" 窗体的透明度插件
" ================
" https://github.com/dbarsam/vim-vimtweak
" autocmd BufReadPost * call libcallnr("vimtweak.dll", "SetAlpha", 255)


" Drwait  绘图ascii图插件
" ===================================================
" http://www.vim.org/scripts/script.php?script_id=40
"    \di to start DrawIt and
"    \ds to stop  DrawIt.