if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'salty') == -1

" syntax highlighting for salty
" author: adit (adit@adit.io)

if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

if get(g:, 'salty_backpack', 0)
  syn keyword saltyBackpackStructure unit signature
  syn keyword saltyBackpackDependency dependency
endif

syn spell notoplevel
syn match saltyRecordField contained containedin=saltyBlock
  \ "[_a-z][a-zA-Z0-9_']*\(,\s*[_a-z][a-zA-Z0-9_']*\)*\_s\+:\_s"
  \ contains=
  \ saltyIdentifier,
  \ saltyOperators,
  \ saltySeparator,
  \ saltyParens
syn match saltyTypeSig
  \ "^\s*\(where\s\+\|let\s\+\|default\s\+\)\?[_a-z][a-zA-Z0-9_']*#\?\(,\s*[_a-z][a-zA-Z0-9_']*#\?\)*\_s\+::\_s"
  \ contains=
  \ saltyNew,
  \ saltyIdentifier,
  \ saltyOperators,
  \ saltySeparator,
  \ saltyParens
syn keyword saltyNew new
syn keyword saltyDeclKeyword module class instance newtype deriving in
syn match saltyDecl "\<\(type\|data\)\>\s\+\(\<family\>\)\?"
syn keyword saltyImportKeywords import qualified safe as hiding contained
syn keyword saltyForeignKeywords foreign export import ccall safe unsafe interruptible capi prim contained
syn region saltyForeignImport start="\<foreign\>" end="\_s\+::\s" keepend
  \ contains=
  \ saltyString,
  \ saltyOperators,
  \ saltyForeignKeywords,
  \ saltyIdentifier
syn match saltyImport "^\s*\<import\>\s\+\(\<safe\>\s\+\)\?\(\<qualified\>\s\+\)\?.\+\(\s\+\<as\>\s\+.\+\)\?\(\s\+\<hiding\>\)\?"
  \ contains=
  \ saltyParens,
  \ saltyOperators,
  \ saltyImportKeywords,
  \ saltyType,
  \ phpComment,
  \ saltyComment,
  \ saltyBlockComment,
syn keyword saltyKeyword do case of
if get(g:, 'salty_enable_static_pointers', 0)
  syn keyword saltyStatic static
endif
syn keyword saltyConditional if then else
syn match saltyNumber "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>\|\<0[bB][10]\+\>"
syn match saltyFloat "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"
syn match saltySeparator  "[,;]"
syn region saltyParens matchgroup=saltyDelimiter start="(" end=")" contains=TOP,saltyTypeSig,@Spell
syn region saltyBrackets matchgroup=saltyDelimiter start="\[" end="]" contains=TOP,saltyTypeSig,@Spell
syn region saltyBlock matchgroup=saltyDelimiter start="{" end="}" contains=TOP,@Spell
syn keyword saltyInfix infix infixl infixr
syn keyword saltyBottom undefined error
syn match saltyOperators "[-!#$%&\*\+/<=>\?\\^|:.]\+\|\<_\>"
syn match saltyQuote "\<'\+" contained
syn match saltyQuotedType "[A-Z][a-zA-Z0-9_']*\>" contained
syn region saltyQuoted start="\<'\+" end="\>"
  \ contains=
  \ saltyType,
  \ saltyQuote,
  \ saltyQuotedType,
  \ saltySeparator,
  \ saltyParens,
  \ saltyOperators,
  \ saltyIdentifier
syn match phpComment "// \([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$"
  \ contains=
  \ saltyTodo,
  \ @Spell
syn match saltyComment "# \([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$"
  \ contains=
  \ saltyTodo,
  \ @Spell
syn match saltyBacktick "`[A-Za-z_][A-Za-z0-9_\.']*#\?`"
syn region saltyString start=+"+ skip=+\\\\\|\\"+ end=+"+
  \ contains=@Spell
syn match saltyIdentifier "[_a-z][a-zA-z0-9_']*" contained
syn match saltyChar "\<'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'\>"
syn match saltyType "\<[A-Z][a-zA-Z0-9_']*\>"
syn region saltyBlockComment start="{-" end="-}"
  \ contains=
  \ saltyBlockComment,
  \ saltyTodo,
  \ @Spell
syn match saltyPreProc "^#.*$"
syn keyword saltyTodo TODO FIXME contained
" Treat a shebang line at the start of the file as a comment
syn match saltyShebang "\%^#!.*$"
if !get(g:, 'salty_disable_TH', 0)
    syn match saltyQuasiQuoted "." containedin=saltyQuasiQuote contained
    syn region saltyQuasiQuote matchgroup=saltyTH start="\[[_a-zA-Z][a-zA-z0-9._']*|" end="|\]"
    syn region saltyTHBlock matchgroup=saltyTH start="\[\(d\|t\|p\)\?|" end="|]" contains=TOP
    syn region saltyTHDoubleBlock matchgroup=saltyTH start="\[||" end="||]" contains=TOP
endif
if get(g:, 'salty_enable_typeroles', 0)
  syn keyword saltyTypeRoles phantom representational nominal contained
  syn region saltyTypeRoleBlock matchgroup=saltyTypeRoles start="type\s\+role" end="$" keepend
    \ contains=
    \ saltyType,
    \ saltyTypeRoles
endif
if get(g:, 'salty_enable_quantification', 0)
  syn keyword saltyForall forall
endif
if get(g:, 'salty_enable_recursivedo', 0)
  syn keyword saltyRecursiveDo mdo rec
endif
if get(g:, 'salty_enable_arrowsyntax', 0)
  syn keyword saltyArrowSyntax proc
endif
if get(g:, 'salty_enable_pattern_synonyms', 0)
  syn keyword saltyPatternKeyword pattern
endif

highlight def link saltyBottom Macro
highlight def link saltyTH Boolean
highlight def link saltyIdentifier Identifier
highlight def link saltyForeignKeywords Structure
highlight def link saltyKeyword Keyword
highlight def link saltyConditional Conditional
highlight def link saltyNumber Number
highlight def link saltyFloat Float
highlight def link saltySeparator Delimiter
highlight def link saltyDelimiter Delimiter
highlight def link saltyInfix Keyword
highlight def link saltyOperators Operator
highlight def link saltyQuote Operator
highlight def link saltyShebang Comment
highlight def link phpComment Comment
highlight def link saltyComment Comment
highlight def link saltyBlockComment Comment
highlight def link saltyString String
highlight def link saltyChar String
highlight def link saltyBacktick Operator
highlight def link saltyQuasiQuoted String
highlight def link saltyTodo Todo
highlight def link saltyPreProc PreProc
highlight def link saltyAssocType Type
highlight def link saltyQuotedType Type
highlight def link saltyType Type
highlight def link saltyImportKeywords Include
if get(g:, 'salty_classic_highlighting', 0)
  highlight def link saltyDeclKeyword Keyword
  highlight def link saltyDecl Keyword
  highlight def link saltyNew Keyword
else
  highlight def link saltyDeclKeyword Structure
  highlight def link saltyDecl Structure
  highlight def link saltyNew Structure
endif

if get(g:, 'salty_enable_quantification', 0)
  highlight def link saltyForall Operator
endif
if get(g:, 'salty_enable_recursivedo', 0)
  highlight def link saltyRecursiveDo Keyword
endif
if get(g:, 'salty_enable_arrowsyntax', 0)
  highlight def link saltyArrowSyntax Keyword
endif
if get(g:, 'salty_enable_static_pointers', 0)
  highlight def link saltyStatic Keyword
endif
if get(g:, 'salty_classic_highlighting', 0)
  if get(g:, 'salty_enable_pattern_synonyms', 0)
    highlight def link saltyPatternKeyword Keyword
  endif
  if get(g:, 'salty_enable_typeroles', 0)
    highlight def link saltyTypeRoles Keyword
  endif
else
  if get(g:, 'salty_enable_pattern_synonyms', 0)
    highlight def link saltyPatternKeyword Structure
  endif
  if get(g:, 'salty_enable_typeroles', 0)
    highlight def link saltyTypeRoles Structure
  endif
endif

if get(g:, 'salty_backpack', 0)
  highlight def link saltyBackpackStructure Structure
  highlight def link saltyBackpackDependency Include
endif
let b:current_syntax = "salty"

endif

