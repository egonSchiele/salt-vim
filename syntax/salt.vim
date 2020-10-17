" Language:    Salty
" Maintainer:  Adit <bluemangroupie@gmail.com>
" Based On:    saltScript by leafo <leafot@gmail.com>
" URL:         http://github.com/adit/salty-vim
" License:     WTFPL

" Bail if our syntax is already loaded.
if exists('b:current_syntax') && b:current_syntax == 'salt'
  finish
endif

if version < 600
  syn clear
endif

" Highlight long strings.
syn sync minlines=100

" These are `matches` instead of `keywords` because vim's highlighting
" priority for keywords is higher than matches. This causes keywords to be
" highlighted inside matches, even if a match says it shouldn't contain them --
syn match saltStatement /\<\%(return\|break\|continue\)\>/ display
hi def link saltStatement Statement

syn match saltRepeat /\<\%(for\|while\)\>/ display
hi def link saltRepeat Repeat

syn match saltConditional /\<\%(if\|else\|elseif\|then\|switch\|when\|unless\)\>/
\                           display
hi def link saltConditional Conditional

" syn match saltException /\<\%(try\|catch\|finally\)\>/ display
" hi def link saltException Exception

syn match saltKeyword /\<\%(export\|local\|import\|from\|with\|in\|and\|or\|not\|class\|extends\|super\|using\|do\)\>/
\                       display
hi def link saltKeyword Keyword

" all built in funcs from Lua 5.1
syn keyword saltLuaFunc assert collectgarbage dofile error next
syn keyword saltLuaFunc print rawget rawset tonumber tostring type _VERSION
syn keyword saltLuaFunc _G getfenv getmetatable ipairs loadfile
syn keyword saltLuaFunc loadstring pairs pcall rawequal
syn keyword saltLuaFunc require setfenv setmetatable unpack xpcall
syn keyword saltLuaFunc load module select
syn match saltLuaFunc /package\.cpath/
syn match saltLuaFunc /package\.loaded/
syn match saltLuaFunc /package\.loadlib/
syn match saltLuaFunc /package\.path/
syn match saltLuaFunc /package\.preload/
syn match saltLuaFunc /package\.seeall/
syn match saltLuaFunc /coroutine\.running/
syn match saltLuaFunc /coroutine\.create/
syn match saltLuaFunc /coroutine\.resume/
syn match saltLuaFunc /coroutine\.status/
syn match saltLuaFunc /coroutine\.wrap/
syn match saltLuaFunc /coroutine\.yield/
syn match saltLuaFunc /string\.byte/
syn match saltLuaFunc /string\.char/
syn match saltLuaFunc /string\.dump/
syn match saltLuaFunc /string\.find/
syn match saltLuaFunc /string\.len/
syn match saltLuaFunc /string\.lower/
syn match saltLuaFunc /string\.rep/
syn match saltLuaFunc /string\.sub/
syn match saltLuaFunc /string\.upper/
syn match saltLuaFunc /string\.format/
syn match saltLuaFunc /string\.gsub/
syn match saltLuaFunc /string\.gmatch/
syn match saltLuaFunc /string\.match/
syn match saltLuaFunc /string\.reverse/
syn match saltLuaFunc /table\.maxn/
syn match saltLuaFunc /table\.concat/
syn match saltLuaFunc /table\.sort/
syn match saltLuaFunc /table\.insert/
syn match saltLuaFunc /table\.remove/
syn match saltLuaFunc /math\.abs/
syn match saltLuaFunc /math\.acos/
syn match saltLuaFunc /math\.asin/
syn match saltLuaFunc /math\.atan/
syn match saltLuaFunc /math\.atan2/
syn match saltLuaFunc /math\.ceil/
syn match saltLuaFunc /math\.sin/
syn match saltLuaFunc /math\.cos/
syn match saltLuaFunc /math\.tan/
syn match saltLuaFunc /math\.deg/
syn match saltLuaFunc /math\.exp/
syn match saltLuaFunc /math\.floor/
syn match saltLuaFunc /math\.log/
syn match saltLuaFunc /math\.log10/
syn match saltLuaFunc /math\.max/
syn match saltLuaFunc /math\.min/
syn match saltLuaFunc /math\.fmod/
syn match saltLuaFunc /math\.modf/
syn match saltLuaFunc /math\.cosh/
syn match saltLuaFunc /math\.sinh/
syn match saltLuaFunc /math\.tanh/
syn match saltLuaFunc /math\.pow/
syn match saltLuaFunc /math\.rad/
syn match saltLuaFunc /math\.sqrt/
syn match saltLuaFunc /math\.frexp/
syn match saltLuaFunc /math\.ldexp/
syn match saltLuaFunc /math\.random/
syn match saltLuaFunc /math\.randomseed/
syn match saltLuaFunc /math\.pi/
syn match saltLuaFunc /io\.stdin/
syn match saltLuaFunc /io\.stdout/
syn match saltLuaFunc /io\.stderr/
syn match saltLuaFunc /io\.close/
syn match saltLuaFunc /io\.flush/
syn match saltLuaFunc /io\.input/
syn match saltLuaFunc /io\.lines/
syn match saltLuaFunc /io\.open/
syn match saltLuaFunc /io\.output/
syn match saltLuaFunc /io\.popen/
syn match saltLuaFunc /io\.read/
syn match saltLuaFunc /io\.tmpfile/
syn match saltLuaFunc /io\.type/
syn match saltLuaFunc /io\.write/
syn match saltLuaFunc /os\.clock/
syn match saltLuaFunc /os\.date/
syn match saltLuaFunc /os\.difftime/
syn match saltLuaFunc /os\.execute/
syn match saltLuaFunc /os\.exit/
syn match saltLuaFunc /os\.getenv/
syn match saltLuaFunc /os\.remove/
syn match saltLuaFunc /os\.rename/
syn match saltLuaFunc /os\.setlocale/
syn match saltLuaFunc /os\.time/
syn match saltLuaFunc /os\.tmpname/
syn match saltLuaFunc /debug\.debug/
syn match saltLuaFunc /debug\.gethook/
syn match saltLuaFunc /debug\.getinfo/
syn match saltLuaFunc /debug\.getlocal/
syn match saltLuaFunc /debug\.getupvalue/
syn match saltLuaFunc /debug\.setlocal/
syn match saltLuaFunc /debug\.setupvalue/
syn match saltLuaFunc /debug\.sethook/
syn match saltLuaFunc /debug\.traceback/
syn match saltLuaFunc /debug\.getfenv/
syn match saltLuaFunc /debug\.getmetatable/
syn match saltLuaFunc /debug\.getregistry/
syn match saltLuaFunc /debug\.setfenv/
syn match saltLuaFunc /debug\.setmetatable/

hi def link saltLuaFunc Identifier

" The first case matches symbol operators only if they have an operand before.
syn match saltExtendedOp /\%(\S\s*\)\@<=[+\-*/%&|\^=!<>?#]\+\|\.\|\\/
\                          display
hi def link saltExtendedOp saltOperator
hi def link saltOperator Operator

syntax match saltFunction /:=/
highlight default link saltFunction Function

" This is separate from `saltExtendedOp` to help differentiate commas from
" dots.
syn match saltSpecialOp /[,;]/ display
hi def link saltSpecialOp SpecialChar

syn match saltBoolean /\<\%(true\|false\)\>/ display
hi def link saltBoolean Boolean

syn match saltGlobal /\<\%(null\)\>/ display
hi def link saltGlobal Type

" A special variable
syn match saltSpecialVar /\<\%(self\)\>/ display
" An @-variable
syn match saltSpecialVar /@\%(\I\i*\)\?/ display
hi def link saltSpecialVar Structure

" A class-like name that starts with a capital letter
syn match saltObject /\<\u\w*\>/ display
hi def link saltObject Structure

" A constant-like name in SCREAMING_CAPS
syn match saltConstant /_?[A-Z0-9_]\+/ display
hi def link saltConstant Constant

" A variable name
syn cluster saltIdentifier contains=saltSpecialVar,saltObject,
\                                     saltConstant

" A non-interpolated string
syn cluster saltBasicString contains=@Spell,saltEscape
" An interpolated string
syn cluster saltInterpString contains=@saltBasicString,saltInterp

" Regular strings
syn region saltString start=/"/ skip=/\\\\\|\\"/ end=/"/
\                       contains=@saltInterpString
syn region saltString start=/'/ skip=/\\\\\|\\'/ end=/'/
\                       contains=@saltBasicString
hi def link saltString String

syn region saltString2 matchgroup=saltString start="\[\z(=*\)\[" end="\]\z1\]" contains=@Spell
hi def link saltString2 String


" A integer, including a leading plus or minus
syn match saltNumber /\i\@<![-+]\?\d\+\%([eE][+-]\?\d\+\)\?/ display
" A hex number
syn match saltNumber /\<0[xX]\x\+\>/ display
hi def link saltNumber Number

" A floating-point number, including a leading plus or minus
syn match saltFloat /\i\@<![-+]\?\d*\.\@<!\.\d\+\%([eE][+-]\?\d\+\)\?/
\                     display
hi def link saltFloat Float

" An error for reserved keywords
" if !exists("salt_no_reserved_words_error")
"   syn match saltReservedError /\<\%(end\|function\|repeat\)\>/
"   \                             display
"   hi def link saltReservedError Error
" endif

" This is separate from `saltExtendedOp` since assignments require it.
syn match saltAssignOp /:/ contained display
hi def link saltAssignOp saltOperator

" Strings used in string assignments, which can't have interpolations
syn region saltAssignString start=/"/ skip=/\\\\\|\\"/ end=/"/ contained
\                             contains=@saltBasicString
syn region saltAssignString start=/'/ skip=/\\\\\|\\'/ end=/'/ contained
\                             contains=@saltBasicString
hi def link saltAssignString String

" A normal object assignment
syn match saltObjAssign /@\?\I\i*\s*:\@<!::\@!/
\                         contains=@saltIdentifier,saltAssignOp
hi def link saltObjAssign Identifier

" Short hand table literal assign
syn match saltShortHandAssign /:\@<!:@\?\I\i*\s*/
\                         contains=@saltIdentifier,saltAssignOp
hi def link saltShortHandAssign Identifier

" An object-string assignment
syn match saltObjStringAssign /\("\|'\)[^\1]*\1\s*;\@<!::\@!'\@!/
\                               contains=saltAssignString,saltAssignOp
" An object-integer assignment
syn match saltObjNumberAssign /\d\+\%(\.\d\+\)\?\s*:\@<!::\@!/
\                               contains=saltNumber,saltAssignOp

syn keyword saltTodo TODO FIXME XXX contained
hi def link saltTodo Todo

syn match saltComment "\%^#!.*"
syn match saltComment /--.*/ contains=@Spell,saltTodo
hi def link saltComment Comment

" syn region saltBlockComment start=/####\@!/ end=/###/
" \                             contains=@Spell,saltTodo
" hi def link saltBlockComment saltComment

syn region saltInterp matchgroup=saltInterpDelim start=/#{/ end=/}/ contained
\                       contains=@saltAll
hi def link saltInterpDelim PreProc

" A string escape sequence
syn match saltEscape /\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}\|\\./ contained display
hi def link saltEscape SpecialChar

" Heredoc strings
" syn region saltHeredoc start=/"""/ end=/"""/ contains=@saltInterpString
" \                        fold
" syn region saltHeredoc start=/'''/ end=/'''/ contains=@saltBasicString
" \                        fold
" hi def link saltHeredoc String

" An error for trailing whitespace, as long as the line isn't just whitespace
if !exists("salt_no_trailing_space_error")
  syn match saltSpaceError /\S\@<=\s\+$/ display
  hi def link saltSpaceError Error
endif

" An error for trailing semicolons, for help transitioning from JavaScript
if !exists("salt_no_trailing_semicolon_error")
  syn match saltSemicolonError /;$/ display
  hi def link saltSemicolonError Error
endif

" Ignore reserved words in dot accesses.
syn match saltDotAccess /\.\@<!\.\s*\I\i*/he=s+1 contains=@saltIdentifier
hi def link saltDotAccess saltExtendedOp

" This is required for interpolations to work.
syn region saltCurlies matchgroup=saltCurly start=/{/ end=/}/
\                        contains=@saltAll contained

" " These are highlighted the same as commas since they tend to go together.
" hi def link saltBlock saltSpecialOp
" hi def link saltBracket saltBlock
" hi def link saltCurly saltBlock
" hi def link saltParen saltBlock

" This is used instead of TOP to keep things salt-specific for good
" embedding. `contained` groups aren't included.
syn cluster saltAll contains=saltStatement,saltRepeat,saltConditional,
\                              saltKeyword,saltOperator,saltFunction,
\                              saltExtendedOp,saltSpecialOp,saltBoolean,
\                              saltGlobal,saltSpecialVar,saltObject,
\                              saltConstant,saltString,saltNumber,
\                              saltFloat,saltReservedError,saltObjAssign,
\                              saltObjStringAssign,saltObjNumberAssign,
\                              saltShortHandAssign,saltComment,saltLuaFunc,
\                              saltSpaceError,saltSemicolonError,
\                              saltDotAccess,
\                              saltCurlies

if !exists('b:current_syntax')
  let b:current_syntax = 'salt'
endif
