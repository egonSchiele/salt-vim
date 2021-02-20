if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'salty') == -1

" syntax highlighting for salty
" author: adit (adit@adit.io)

if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword basicLanguageKeywords guard if then else class where otherwise return new join split in keyin uniq pop keys values reverse count size shuffle sub and self
syn keyword basicLanguageKeywords map each any all select var_dump $$ do end import let var
syn keyword basicLanguageKeywords use throw require require_once include include_once const public private protected static namespace echo print extends implements as from
syn keyword javascriptKeywords super document export default
syn keyword htmlAttributes href src onClick id style class
syn keyword javascriptFunctions preventDefault length Object getElementById
syn keyword reactKeywords render props useState children useEffect
syn keyword reduxKeywords createStore combineReducers dispatch
syn keyword basicTypes string int array bool float null object
syn keyword saltyBool true false
syn keyword saltyMagicConstant __LINE__ __FILE__ __DIR__ __FUNCTION__ __CLASS__ __TRAIT__ __METHOD__ __NAMESPACE__
syn keyword htmlKeywords a p div br h1 h2 h3 h4 h5 h6 img span html title body head b blockquote code em pre small strong sub sup input ul ol li
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
syn region saltyBackticks start="`" end="`" skip="\\\\\|\\`"

let b:current_syntax = "salty"

hi def link basicLanguageKeywords Statement
hi def link javascriptKeywords Statement
hi def link functionName Function
hi def link javascriptFunctions Function
hi def link htmlAttributes Function
hi def link functionTypeSignature Function
hi def link reactKeywords Function
hi def link reduxKeywords Function
hi def link saltyComment Comment
hi def link phpComment Comment
hi def link saltyString String
hi def link saltyBackticks String
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
hi def link saltyMagicConstant Identifier
hi def link htmlKeywords Identifier


endif

