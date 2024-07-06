se nu rnu ai ts=4 sw=4
sy on
ino ( ()<Esc>i
ino ' ''<Esc>i
ino " ""<Esc>i
ino [ []<Esc>i
ino {<CR> {<CR>}<Esc>i
ino jj <Esc>
map <F5> :w<CR>:!g++ -g -fsanitize=undefined,address  -Wall -Wextra -Wshadow %:r.cpp -o %:r &&echo "Compiled" && ./%:r<CR>
imap <F5> <Esc><F5>


nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
