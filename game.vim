
" man walking
let g:main_character = "ee1d"

function LoadTexture()

	" TODO: idea, use conceals for dialogs.

	" == cute ==
	"
	"::cat-::::house-::::cloud-::::apple-::
	"
	
	call matchadd('Conceal', '::cat'   , 10, -1, {'conceal':"\ueeed"})
	call matchadd('Conceal', '::house' , 10, -1, {'conceal':"\uf015"})
	call matchadd('Conceal', '::cloud' , 10, -1, {'conceal':"\uf0c2"})
	call matchadd('Conceal', '::apple' , 10, -1, {'conceal':"\uee98"})

	" == faces ==
	"
	"::sad-::::meh-::::cry-::::haha-::::wink-:: 
	"::happy-::::smile-::::frown-::::beam-haha-:: 
	"::beam-wink-::::face-beam-::::face-grin-::::face-heart-:: 
	"::face-laugh-::::face-stars-::::face-funny-::::face-empty-::
	"
	 
	call matchadd('Conceal', '::sad'   , 10, -1, {'conceal':"\uf119"})
	call matchadd('Conceal', '::meh'   , 10, -1, {'conceal':"\uf11a"})
	call matchadd('Conceal', '::cry'   , 10, -1, {'conceal':"\uee7c"})
	call matchadd('Conceal', '::haha'  , 10, -1, {'conceal':"\uee62"})
	call matchadd('Conceal', '::wink'  , 10, -1, {'conceal':"\uee55"})
	call matchadd('Conceal', '::happy' , 10, -1, {'conceal':"\uee49"})
	call matchadd('Conceal', '::smile' , 10, -1, {'conceal':"\uf118"})
	call matchadd('Conceal', '::frown' , 10, -1, {'conceal':"\uee43"})

	call matchadd('Conceal', '::beam-haha'  , 10, -1, {'conceal':"\uee63"})
	call matchadd('Conceal', '::beam-wink'  , 10, -1, {'conceal':"\uee65"})
	call matchadd('Conceal', '::face-beam'  , 10, -1, {'conceal':"\uee4b"})
	call matchadd('Conceal', '::face-grin'  , 10, -1, {'conceal':"\uee4a"})
	call matchadd('Conceal', '::face-heart' , 10, -1, {'conceal':"\uee4d"})
	call matchadd('Conceal', '::face-laugh' , 10, -1, {'conceal':"\uee4e"})
	call matchadd('Conceal', '::face-stars' , 10, -1, {'conceal':"\uee50"})
	call matchadd('Conceal', '::face-funny' , 10, -1, {'conceal':"\uee4f"})
	call matchadd('Conceal', '::face-empty' , 10, -1, {'conceal':"\uee6d"})

	" == outro ==
	"
	"::warn-::::wand-::::chat-::::glass-::::watch-::
	"::money-::::wrench-::::random-::::warnbox-::
	"
	call matchadd('Conceal', '::warn'   , 10, -1, {'conceal':"\uf071"})
	call matchadd('Conceal', '::wand'   , 10, -1, {'conceal':"\uef15"})
	call matchadd('Conceal', '::chat'   , 10, -1, {'conceal':"\ued20"})
	call matchadd('Conceal', '::glass'  , 10, -1, {'conceal':"\uedae"})
	call matchadd('Conceal', '::watch'  , 10, -1, {'conceal':"\ueb7c"})
	call matchadd('Conceal', '::money'  , 10, -1, {'conceal':"\uefc8"})
	call matchadd('Conceal', '::wrench' , 10, -1, {'conceal':"\uf0ad"})
	call matchadd('Conceal', '::random' , 10, -1, {'conceal':"\uf074"})
	call matchadd('Conceal', '::warnbox', 10, -1, {'conceal':"\uf50a"})

	" -emoji postfix
	call matchadd('Conceal', '-emoji::', 10, -1, {'conceal':" "})
	" shorthand
	call matchadd('Conceal', '-::', 10, -1, {'conceal':" "})

	" Player
	call matchadd('Player', '\%u' . g:main_character, 10, -1)

	" TODO MapHidden
	" call matchadd('MapHidden', '#.\+#', 10, -1)
	" set cursorline

	" get theme
	source colors.vim

	set conceallevel=2

	" hide cursor ( NVIM ONLY )
	hi Cursor blend=100
	set guicursor+=a:Cursor/lCursor

	set nowrap
	set nonumber
	set norelativenumber

	" TODO: Statusline with HP
endfunction

" Controls
function AnimateMove()

	" TODO

	" if g:main_character == "f29d"
	" 	let g:main_character="ee1d"

	" 	return
	" endif

	" let g:main_character="f29d"
endfunction

" Collide with walls right
function MoveRight()

	let l:char = strgetchar(getline('.')[col('.') + 3:], 0)

	if l:char >= 0
		if nr2char(l:char) !~ '|\|-\|#'
			exe "norm! r lr\<c-v>u" . g:main_character
		endif
	endif
endfunction

" Collide with walls left
function MoveLeft()

	if col('.') <= 2
		return
	endif

	let l:char = strgetchar(getline('.')[col('.') - 2:], 0)

	if l:char >= 0
		if nr2char(l:char) !~ '|\|-\|#'
			exe "norm! r hr\<c-v>u" . g:main_character
		endif
	endif
endfunction

 " Collide with walls up
function MoveUp()

	if line('.') <= 1
		return
	endif

	let l:line = getline(line('.') - 1)
	let l:char = strgetchar(l:line[col('.'):], 0)

	if l:char >= 0
		if nr2char(l:char) !~ '|\|-\|#'
			exe "norm! r kr\<c-v>u" . g:main_character
		endif
	endif
endfunction

" Collide with walls down
function MoveDown()

	if line('.') >= line('$')
		return
	endif

	let l:line = getline(line('.') + 1)
	let l:char = strgetchar(l:line[col('.'):], 0)

	if l:char >= 0
		if nr2char(l:char) !~ '|\|-\|#'
			exe "norm! r jr\<c-v>u" . g:main_character
		endif
	endif
endfunction

" Debug mode
function DebugMode()

	" give back the power
 	mapclear
	nmapclear

	hi Cursor blend=0
endfunction

function LoadControls()

	" No-Op -ing vim
	
	mapclear
	nmapclear
	vmapclear
	xmapclear
	smapclear
	omapclear
	imapclear
	lmapclear
	cmapclear
	
	nnoremap <C-A> 		<esc>
	nnoremap <C-B> 		<esc>
	nnoremap <C-C> 		<esc>
	nnoremap <C-D> 		<esc>
	nnoremap <C-E> 		<esc>
	nnoremap <C-F> 		<esc>
	nnoremap <C-G> 		<esc>
	nnoremap <BS>		<esc>
	nnoremap <C-H> 		<esc>
	nnoremap <Tab>		<esc>
	nnoremap <C-I> 		<esc>
	nnoremap <C-J> 	       	<esc>
	nnoremap <C-L> 	       	<esc>
	nnoremap <CR>	       	<esc>
	nnoremap <S-CR>	       	<esc>
	nnoremap <C-M> 	       	<esc>
	nnoremap <C-N> 	       	<esc>
	nnoremap <C-O> 	       	<esc>
	nnoremap <C-P> 	       	<esc>
	nnoremap <C-R> 	       	<esc>
	nnoremap <C-T> 	       	<esc>
	nnoremap <C-U> 	       	<esc>
	nnoremap <C-V> 	       	<esc>
	nnoremap <C-W> 	       	<esc>
	nnoremap <C-X> 	       	<esc>
	nnoremap <C-Y> 	       	<esc>
	nnoremap <C-Z> 	       	<esc>
	nnoremap <C-]> 	       	<esc>
	nnoremap <C-^> 	       	<esc>
	nnoremap <C-Tab> 	<esc>
	nnoremap <Space>	<esc>
	nnoremap !		<esc>
	nnoremap !!		<esc>
	nnoremap "		<esc>
	nnoremap #		<esc>
	nnoremap $		<esc>
	nnoremap %		<esc>
	nnoremap N%		<esc>
	nnoremap &		<esc>
	nnoremap '		<esc>
	nnoremap ''		<esc>
	nnoremap '(		<esc>
	nnoremap ')		<esc>
	nnoremap '<		<esc>
	nnoremap '>		<esc>
	nnoremap '[		<esc>
	nnoremap ']		<esc>
	nnoremap '{		<esc>
	nnoremap '}		<esc>
	nnoremap (		<esc>
	nnoremap )		<esc>
	nnoremap *		<esc>
	nnoremap +		<esc>
	nnoremap <S-Plus>	<esc>
	nnoremap ,		<esc>
	nnoremap -		<esc>
	nnoremap <S-Minus>	<esc>
	nnoremap .		<esc>
	nnoremap /		<esc>
	nnoremap /<CR>		<esc>
	nnoremap 0		<esc>
	nnoremap :		<esc>
	nnoremap N:		<esc>
	nnoremap ;		<esc>
	nnoremap <		<esc>
	nnoremap <<		<esc>
	nnoremap =		<esc>
	nnoremap ==		<esc>
	nnoremap >		<esc>
	nnoremap >>		<esc>
	nnoremap ?		<esc>
	nnoremap ?<CR>		<esc>
	nnoremap @		<esc>
	nnoremap @:		<esc>
	nnoremap @@		<esc>
	nnoremap A		<esc>
	nnoremap B		<esc>
	nnoremap C		<esc>
	nnoremap D		<esc>
	nnoremap E		<esc>
	nnoremap F		<esc>
	nnoremap G		<esc>
	nnoremap H		<esc>
	nnoremap I		<esc>
	nnoremap J		<esc>
	nnoremap K		<esc>
	nnoremap L		<esc>
	nnoremap M		<esc>
	nnoremap N		<esc>
	nnoremap O		<esc>
	nnoremap P		<esc>
	nnoremap R		<esc>
	nnoremap S		<esc>
	nnoremap T		<esc>
	nnoremap U		<esc>
	nnoremap V		<esc>
	nnoremap W		<esc>
	nnoremap X		<esc>
	nnoremap Y		<esc>
	nnoremap ZZ		<esc>
	nnoremap ZQ		<esc>
	nnoremap [		<esc>
	nnoremap ]		<esc>
	nnoremap ^		<esc>
	nnoremap _		<esc>
	nnoremap `		<esc>
	nnoremap `(		<esc>
	nnoremap `)		<esc>
	nnoremap `<		<esc>
	nnoremap `>		<esc>
	nnoremap `[		<esc>
	nnoremap `]		<esc>
	nnoremap ``		<esc>
	nnoremap `{		<esc>
	nnoremap `}		<esc>
	nnoremap a		<esc>
	nnoremap b		<esc>
	nnoremap c		<esc>
	nnoremap cc		<esc>
	nnoremap d		<esc>
	nnoremap dd		<esc>
	nnoremap do		<esc>
	nnoremap dp		<esc>
	nnoremap e		<esc>
	nnoremap f		<esc>
	nnoremap g		<esc>
	nnoremap h		<esc>
	nnoremap i		<esc>
	nnoremap j		<esc>
	nnoremap k		<esc>
	nnoremap l		<esc>
	nnoremap m		<esc>
	nnoremap n		<esc>
	nnoremap o		<esc>
	nnoremap p		<esc>
	nnoremap q		<esc>
	nnoremap q		<esc>
	nnoremap Q		<esc>
	nnoremap q:		<esc>
	nnoremap q/		<esc>
	nnoremap q?		<esc>
	nnoremap r		<esc>
	nnoremap s		<esc>
	nnoremap t		<esc>
	nnoremap u		<esc>
	nnoremap v		<esc>
	nnoremap w		<esc>
	nnoremap x		<esc>
	nnoremap y		<esc>
	nnoremap yy		<esc>
	nnoremap z		<esc>
	nnoremap {		<esc>
	nnoremap bar		<esc>
	nnoremap }		<esc>
	nnoremap ~		<esc>
	nnoremap <C-End>	<esc>
	nnoremap <C-Home>	<esc>
	nnoremap <C-Left>	<esc>
	nnoremap <C-LeftMouse>	<esc>
	nnoremap <C-Right>	<esc>
	nnoremap <C-RightMouse> <esc>
	nnoremap <C-Tab>	<esc>
	nnoremap <Del>		<esc>
	nnoremap N<Del>	 	<esc>
	nnoremap <Down>	 	<esc>
	nnoremap <End>		<esc>
	nnoremap <F1>		<esc>
	nnoremap <Help>	 	<esc>
	nnoremap <Home>	 	<esc>
	nnoremap <Insert>	<esc>
	nnoremap <Left>	 	<esc>
	nnoremap <LeftMouse>	<esc>
	nnoremap <MiddleMouse>	<esc>
	nnoremap <PageDown>	<esc>
	nnoremap <PageUp>	<esc>
	nnoremap <Right>	<esc>
	nnoremap <RightMouse>	<esc>
	nnoremap <S-Down>	<esc>
	nnoremap <S-Left>	<esc>
	nnoremap <S-LeftMouse>	<esc>
	nnoremap <S-Right>	<esc>
	nnoremap <S-RightMouse> <esc>
	nnoremap <S-Up>	 	<esc>
	nnoremap <Undo>	 	<esc>
	nnoremap <Up>		<esc> 

	" debug mode
	nnoremap <up><up><down><down><left><right><left><right>ba	:call DebugMode()<cr>

	" TODO: check after moving, to see
	"  - if new area was found
	"  - if enemy was confronted
	"  - if item was obtained
	nnoremap k :call MoveUp()<cr>
	nnoremap h :call MoveLeft()<cr>
	nnoremap j :call MoveDown()<cr>
	nnoremap l :call MoveRight()<cr>

	nnoremap q :qa!<cr>
endfunction

" World generation
function GenerateBounded(width)
        normal!0o|
	execute "normal!" . string(a:width) . "A "
	normal!A|
endfunction

function GenerateVerticalBounds(width, start, height)
	execute "normal!:" . string(a:start) . "\<cr>"
        normal!0i-
	execute "normal!" . string(a:width) . "A-"
	normal!A-

	execute "normal!:" . string(a:start + a:height) . "\<cr>"
        normal!0o-
	execute "normal!" . string(a:width) . "A-"
	normal!A-
endfunction

function RandomNumber(min, max)

	call luaeval('math.randomseed(os.time())')
	let l:num = luaeval('math.random(' . string(a:min) . ', ' . string(a:max) . ')')

	return l:num
endfunction

function RandomStructure(max_column)
endfunction

function RandomRoom()
	
	let l:start    = line(".")

	let l:height   = RandomNumber(16,70)
	let l:width    = RandomNumber(16,70)

	" position of the door along the middle of height/width
	let l:door_pos = RandomNumber(1,40)

	let l:c = 1

	while l:c <= l:height
		call GenerateBounded(l:width)

		let l:c += 1
	endwhile

	call GenerateVerticalBounds(l:width, l:start, l:height) 
endfunction

" Game
function NewGame()
	%bdelete!

	set nocindent
	set nosmarttab
	set noautoindent
	set nosmartindent

	call RandomRoom()
	normal!gg0lljjj

 	execute "normal! r lr\<c-v>u" . g:main_character

	" If user enters insert mode then something is wrong
	" autocmd InsertEnter * exe "exit!"
endfunction

call LoadTexture()
call LoadControls()
call NewGame()

