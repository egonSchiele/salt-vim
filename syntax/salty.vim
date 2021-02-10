if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'salty') == -1

" syntax highlighting for salty
" author: adit (adit@adit.io)

if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword basicLanguageKeywords guard if then else class where otherwise return new join split in keyin uniq pop keys values reverse count size shuffle sub
syn keyword basicLanguageKeywords map each any all select
syn keyword basicTypes string int array bool
syn keyword saltyBool true false
syn match saltyNumber "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>\|\<0[bB][10]\+\>"
syn match saltyFloat "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"
syn match saltySeparator  "[,;]"
syn match saltyOperators "[-!#$%&\*\+/<=>\?\\^|:.\[\]]\+\|\<_\>"
syn match saltyType "\<[A-Z][a-zA-Z0-9_']*\>"
syn match functionName "^\s*\([^ ]*\)\ze .* := .*"
syn match functionName "^\s*\([^ ]*\)\ze := .*"
syn match functionTypeSignature "\(.*\)\ze :: .*"
syn match saltyClassVariable    "@@\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*" display
syn match saltyInstanceVariable "@\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*"  display
syn match saltyDotNotation " :\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*"  display


syn match saltyComment "# .*$"
syn match phpComment "// .*$"
syn region saltyString start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region saltyString start=+'+ skip=+\\\\\|\\"+ end=+'+

let b:current_syntax = "salty"

hi def link basicLanguageKeywords Statement
hi def link functionName Function
hi def link functionTypeSignature Function
hi def link saltyComment Comment
hi def link phpComment Comment
hi def link saltyString Constant
hi def link saltyNumber Constant
hi def link saltyFloat Constant
hi def link operators PreProc
hi def link saltySeparator Delimiter
hi def link saltyOperators Operator
hi def link saltyType Type
hi def link basicTypes Type
hi def link saltyInstanceVariable Identifier
hi def link saltyClassVariable Identifier
hi def link saltyDotNotation Identifier
hi def link saltyBool Boolean


endif

