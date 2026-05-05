" Vim syntax file
" Language:    Oberon
" Maintainer:  Vim Project
" Last Change: 2024 Jan 04
"
" References:
"   The Oberon Programming Language by Niklaus Wirth (Revision 1.10.90)
"   https://people.inf.ethz.ch/wirth/Oberon/Oberon.Report.pdf
"
" EBNF (selected productions):
"   Module     = MODULE ident ";" [ImportList] DeclarationSequence
"                [BEGIN StatementSequence] END ident "." .
"   ImportList = IMPORT import {"," import} ";" .
"   Import     = ident [":=" ident] .
"   DeclarationSequence = {CONST {ConstantDeclaration ";"} |
"                          TYPE {TypeDeclaration ";"} |
"                          VAR {VariableDeclaration ";"}}
"                         {ProcedureDeclaration ";" | ForwardDeclaration ";"} .
"   ConstantDeclaration = identdef "=" ConstExpression .
"   TypeDeclaration     = identdef "=" type .
"   VariableDeclaration = IdentList ":" type .
"   ProcedureDeclaration= ProcedureHeading ";" ProcedureBody ident .
"   ProcedureHeading    = PROCEDURE identdef [FormalParameters] .
"   ForwardDeclaration  = PROCEDURE "^" identdef [FormalParameters] .
"   FormalParameters    = "(" [FPSection {";" FPSection}] ")" [":" qualident] .
"   FPSection           = [VAR] ident {"," ident} ":" FormalType .
"   FormalType          = {ARRAY OF} qualident .
"   statement = [assignment | ProcedureCall | IfStatement | CaseStatement |
"                WhileStatement | RepeatStatement | LoopStatement |
"                WithStatement | EXIT | RETURN [expression]] .
"   assignment = designator ":=" expression .
"   IfStatement    = IF expression THEN StatementSequence
"                    {ELSIF expression THEN StatementSequence}
"                    [ELSE StatementSequence] END .
"   CaseStatement  = CASE expression OF case {"|" case}
"                    [ELSE StatementSequence] END .
"   WhileStatement = WHILE expression DO StatementSequence END .
"   RepeatStatement= REPEAT StatementSequence UNTIL expression .
"   LoopStatement  = LOOP StatementSequence END .
"   WithStatement  = WITH qualident ":" qualident DO StatementSequence END .
"   expression     = SimpleExpression [relation SimpleExpression] .
"   relation       = "=" | "#" | "<" | "<=" | ">" | ">=" | IN | IS .
"   SimpleExpression = ["+"|"-"] term {AddOperator term} .
"   AddOperator    = "+" | "-" | OR .
"   term           = factor {MulOperator factor} .
"   MulOperator    = "*" | "/" | DIV | MOD | "&" .
"   factor         = number | CharConstant | string | NIL | set |
"                    designator [ActualParameters] |
"                    "(" expression ")" | "~" factor .
"   set            = "{" [element {"," element}] "}" .
"   element        = expression [".." expression] .
"   designator     = qualident {"." ident | "[" ExpList "]" |
"                    "(" qualident ")" | "^"} .
"   identdef       = ident ["*"] .

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match

" ============================================================================
" Comments: (* ... *) — may be nested
" ============================================================================
syn region  oberonComment  start="(\*"  end="\*)"
      \ contains=oberonComment,oberonTodo  fold
syn keyword oberonTodo  contained  TODO  FIXME  XXX  NOTE

" ============================================================================
" String literals (single-line; no escape sequences per the Oberon report)
"   string = '"' {character} '"' .
" ============================================================================
syn region  oberonString  start='"'  end='"'   oneline
syn region  oberonString  start="'"  end="'"   oneline

" ============================================================================
" Numeric literals
"   integer    = digit {digit} | digit {hexDigit} "H" .
"   real       = digit {digit} "." {digit} [ScaleFactor] .
"   ScaleFactor= ("E" | "D") ["+" | "-"] digit {digit} .
"   CharConstant = digit {hexDigit} "X" .
" Listed most-specific first so longer patterns match before shorter ones.
" ============================================================================
syn match   oberonChar    /\<[0-9][0-9A-F]*X\>/
syn match   oberonHex     /\<[0-9][0-9A-F]*H\>/
syn match   oberonReal    /\<[0-9]\+\.[0-9]*\%([ED][+-]\=[0-9]\+\)\=\>/
syn match   oberonInt     /\<[0-9]\+\>/

" ============================================================================
" Predeclared constants (§4)
" ============================================================================
syn keyword oberonConst   TRUE  FALSE  NIL

" ============================================================================
" Predeclared types (§6.1)
" ============================================================================
syn keyword oberonType    BOOLEAN  BYTE  CHAR  INTEGER  LONGINT  LONGREAL
syn keyword oberonType    REAL  SET  SHORTINT

" ============================================================================
" Predeclared procedures and functions (§10.2)
"   ABS ASH CAP CHR COPY DEC ENTIER EXCL HALT INC INCL LEN LONG MAX MIN
"   NEW ODD ORD SHORT SIZE
" Module SYSTEM exports (§12): ADR BIT CC GET LSH PUT ROT VAL
" ============================================================================
syn keyword oberonBuiltin
      \ ABS  ASH  CAP  CHR  COPY  DEC  ENTIER  EXCL  HALT  INC  INCL
      \ LEN  LONG  MAX  MIN  NEW  ODD  ORD  SHORT  SIZE
syn keyword oberonSysBuiltin  ADR  BIT  CC  GET  LSH  PUT  ROT  VAL

" ============================================================================
" Export mark: identdef = ident ["*"]   (§4)
" Defined before the operator groups so that the operators, being defined
" later, have higher priority and override this inside expression regions.
" ============================================================================
syn match   oberonExport  /\*/

" ============================================================================
" Operators — all marked 'contained' so they ONLY appear inside expression
" regions and never match at the declaration / statement-sequence top level.
"
"   relation    = "=" | "#" | "<" | "<=" | ">" | ">="  | IN | IS .
"   AddOperator = "+" | "-" | OR .
"   MulOperator = "*" | "/" | DIV | MOD | "&" .
"   prefix      = "~"  (logical negation, §8.2.1)
"
" Note: unary "+" and "-" share the AddOperator group (§8.2, SimpleExpression).
" ============================================================================
syn match   oberonRelOp   contained  /[=#<>]/
syn match   oberonRelOp   contained  /[<>]=/
syn match   oberonMulOp   contained  /[*\/&]/
syn match   oberonAddOp   contained  /[-+]/
syn match   oberonNotOp   contained  /\~/
syn keyword oberonWordOp  contained  DIV  MOD  OR  IN  IS

" ============================================================================
" Expression cluster — items valid inside any expression context.
" Regions use  contains=@oberonExpr  to open an expression scope.
" ============================================================================
syn cluster oberonExpr  contains=
      \ oberonRelOp,oberonMulOp,oberonAddOp,oberonNotOp,oberonWordOp,
      \ oberonConst,oberonType,oberonBuiltin,oberonSysBuiltin,
      \ oberonString,oberonChar,oberonHex,oberonReal,oberonInt,
      \ oberonIdent,
      \ oberonParen,oberonSet,oberonSubscript,
      \ oberonDotDot,oberonDot,oberonComma,oberonColon,oberonSemi,
      \ oberonCaret,oberonBar,
      \ oberonComment

" ============================================================================
" Naturally-delimited expression regions
"   "(" expression ")"         factor  (§8.1)
"   "{" element {"," …} "}"    set     (§8.2)
"   "[" ExpList "]"             designator subscript  (§8.1)
" ============================================================================
syn region  oberonParen      transparent  matchgroup=oberonDelim
      \ start="("  end=")"
      \ contains=@oberonExpr
syn region  oberonSet        transparent  matchgroup=oberonDelim
      \ start="{"  end="}"
      \ contains=@oberonExpr
syn region  oberonSubscript  transparent  matchgroup=oberonDelim
      \ start="\[" end="\]"
      \ contains=@oberonExpr

" ============================================================================
" Assignment expression  (assignment = designator ":=" expression  §9.1)
" The region starts at ":=" and ends just before the next statement boundary
" so it does not swallow surrounding syntax.  Operators are valid inside.
" ============================================================================
syn region  oberonAssignExpr  transparent  matchgroup=oberonAssignOp
      \ start=":="
      \ end=/;/me=s-1
      \ end=/\<\%(END\|ELSE\|ELSIF\|TO\|THEN\|DO\|UNTIL\|OF\)\>/me=s-1
      \ contains=@oberonExpr

" ============================================================================
" Condition / expression regions delimited by bounding keywords
"
"   IF expression THEN …           (§9.4)
"   ELSIF expression THEN …        (§9.4)
"   WHILE expression DO …          (§9.6)
"   REPEAT … UNTIL expression      (§9.7)
"   CASE expression OF …           (§9.5)
"   RETURN [expression]            (§9.9)
" ============================================================================
syn region  oberonIfExpr  transparent  matchgroup=oberonKwd
      \ start=/\<IF\>/    end=/\<THEN\>/
      \ contains=@oberonExpr
syn region  oberonElsifExpr  transparent  matchgroup=oberonKwd
      \ start=/\<ELSIF\>/  end=/\<THEN\>/
      \ contains=@oberonExpr
syn region  oberonWhileExpr  transparent  matchgroup=oberonKwd
      \ start=/\<WHILE\>/  end=/\<DO\>/
      \ contains=@oberonExpr
syn region  oberonUntilExpr  transparent  matchgroup=oberonKwd
      \ start=/\<UNTIL\>/
      \ end=/;/me=s-1
      \ end=/\<END\>/me=s-1
      \ contains=@oberonExpr
syn region  oberonCaseExpr  transparent  matchgroup=oberonKwd
      \ start=/\<CASE\>/  end=/\<OF\>/
      \ contains=@oberonExpr
syn region  oberonReturnExpr  transparent  matchgroup=oberonKwd
      \ start=/\<RETURN\>/
      \ end=/;/me=s-1
      \ end=/\<\%(END\|ELSE\|ELSIF\)\>/me=s-1
      \ contains=@oberonExpr

" ============================================================================
" CONST declaration block  (§5)
"   ConstantDeclaration = identdef "=" ConstExpression .
"   ConstExpression = expression .
"
" The block spans CONST … up to the next section keyword (not consumed).
" Inside, each identdef is followed by "=" which opens a ConstExpression
" region where operators are valid.
" ============================================================================
syn region  oberonConstBlock  matchgroup=oberonSection
      \ start=/\<CONST\>/
      \ end=/\<\%(TYPE\|VAR\|PROCEDURE\|BEGIN\|END\)\>/me=s-1
      \ contains=oberonConstDecl,oberonComment

"   identdef = ident ["*"]
syn match   oberonConstDecl  contained  /\<[A-Za-z][A-Za-z0-9]*\*\=/
      \ nextgroup=oberonConstExpr  skipwhite  skipnl

"   "=" ConstExpression ";"  — "=" is the definition separator, not a relation
syn region  oberonConstExpr  contained  transparent  matchgroup=oberonConstEq
      \ start=/=/  end=/;/me=s-1
      \ contains=@oberonExpr

" ============================================================================
" Module declaration  (§11)
"   Module = MODULE ident ";" … END ident "." .
" ============================================================================
syn keyword oberonModule  MODULE  nextgroup=oberonModuleName  skipwhite  skipnl
syn match   oberonModuleName  contained  /\<[A-Za-z][A-Za-z0-9]*\>/
      \ nextgroup=oberonModuleSemi  skipwhite
syn match   oberonModuleSemi  contained  /;/

" ============================================================================
" Import list  (§11)
"   ImportList = IMPORT import {"," import} ";" .
"   Import     = ident [":=" ident] .
" ============================================================================
syn keyword oberonImport  IMPORT  nextgroup=oberonImportItem  skipwhite  skipnl
syn match   oberonImportItem   contained  /\<[A-Za-z][A-Za-z0-9]*\>/
      \ nextgroup=oberonImportAlias,oberonImportComma,oberonImportSemi
      \ skipwhite  skipnl
syn match   oberonImportAlias  contained  /:=/
      \ nextgroup=oberonImportMod  skipwhite  skipnl
syn match   oberonImportMod    contained  /\<[A-Za-z][A-Za-z0-9]*\>/
      \ nextgroup=oberonImportComma,oberonImportSemi  skipwhite  skipnl
syn match   oberonImportComma  contained  /,/
      \ nextgroup=oberonImportItem  skipwhite  skipnl
syn match   oberonImportSemi   contained  /;/

" ============================================================================
" Procedure declaration  (§10)
"   ProcedureHeading = PROCEDURE identdef [FormalParameters] .
"   ForwardDeclaration= PROCEDURE "^" identdef [FormalParameters] .
"   identdef         = ident ["*"] .
"   FormalParameters = "(" [FPSection {";" FPSection}] ")" [":" qualident] .
"   FPSection        = [VAR] ident {"," ident} ":" FormalType .
" ============================================================================
syn keyword oberonProcKwd  PROCEDURE
      \ nextgroup=oberonProcFwd,oberonProcName  skipwhite  skipnl

"   "^" for forward declaration
syn match   oberonProcFwd  contained  /\^/
      \ nextgroup=oberonProcName  skipwhite  skipnl

"   identdef: ident ["*"]
syn match   oberonProcName  contained  /\<[A-Za-z][A-Za-z0-9]*\*\=/
      \ nextgroup=oberonFormalPars  skipwhite  skipnl

"   FormalParameters: "(" … ")"
"   No explicit contains= so only non-contained items match (keywords, types,
"   identifiers, punctuation) — operators remain excluded.
syn region  oberonFormalPars  contained  matchgroup=oberonDelim
      \ start="("  end=")"

" ============================================================================
" END ident ["." | ";"]  — closes module, procedure, or structured statement
"   Module:    END ident "."
"   Procedure: END ident ";"
"   Block:     END           (no trailing ident for IF/WHILE/CASE/… blocks)
" ============================================================================
syn keyword oberonEnd  END  nextgroup=oberonEndName  skipwhite  skipnl
syn match   oberonEndName  contained  /\<[A-Za-z][A-Za-z0-9]*\>/
      \ nextgroup=oberonEndDot,oberonEndSemi  skipwhite
syn match   oberonEndDot   contained  /\./
syn match   oberonEndSemi  contained  /;/

" ============================================================================
" Other reserved words not handled by the nextgroup chains above.
" DIV MOD OR IN IS are intentionally absent — they are dyadic operators and
" defined as 'contained' in oberonWordOp so they only appear in expressions.
" ============================================================================
syn keyword oberonKwd
      \ ARRAY  BEGIN  BY  DO  ELSE  EXIT  FOR  LOOP
      \ OF  POINTER  RECORD  REPEAT  THEN  TO
      \ TYPE  UNTIL  VAR  WHILE  WITH

" ============================================================================
" Catch-all identifier (after all keyword / builtin matches)
" ============================================================================
syn match   oberonIdent  /\<[A-Za-z][A-Za-z0-9]*\>/

" ============================================================================
" Top-level punctuation — visible in all contexts
" ============================================================================
syn match   oberonDotDot  /\.\./
syn match   oberonDot     /\./
syn match   oberonComma   /,/
syn match   oberonSemi    /;/
syn match   oberonColon   /:/
syn match   oberonBar     /|/
syn match   oberonCaret   /\^/

" ============================================================================
" Characters not valid in Oberon source
" ============================================================================
syn match   oberonError  /[$?!\\@]/

" ============================================================================
" Highlight definitions
" ============================================================================
hi def link oberonComment     Comment
hi def link oberonTodo        Todo
hi def link oberonString      String
hi def link oberonChar        Character
hi def link oberonHex         Number
hi def link oberonInt         Number
hi def link oberonReal        Float

hi def link oberonConst       Constant
hi def link oberonType        Type
hi def link oberonBuiltin     Function
hi def link oberonSysBuiltin  Function

" Dyadic / prefix operators (contained — only inside expression regions)
hi def link oberonRelOp       Operator
hi def link oberonMulOp       Operator
hi def link oberonAddOp       Operator
hi def link oberonNotOp       Operator
hi def link oberonWordOp      Operator

" Assignment operator (matchgroup for the assignment region)
hi def link oberonAssignOp    Statement

" Bracket delimiters
hi def link oberonDelim       Delimiter

" Top-level punctuation
hi def link oberonDotDot      Operator
hi def link oberonDot         Delimiter
hi def link oberonComma       Delimiter
hi def link oberonSemi        Delimiter
hi def link oberonColon       Delimiter
hi def link oberonBar         Delimiter
hi def link oberonCaret       Operator
hi def link oberonExport      Special

" CONST block
hi def link oberonSection     Keyword
hi def link oberonConstDecl   Identifier
hi def link oberonConstEq     Delimiter

" Module
hi def link oberonModule      Keyword
hi def link oberonModuleName  Function
hi def link oberonModuleSemi  Delimiter

" Import
hi def link oberonImport      Include
hi def link oberonImportItem  Identifier
hi def link oberonImportAlias Operator
hi def link oberonImportMod   Identifier
hi def link oberonImportComma Delimiter
hi def link oberonImportSemi  Delimiter

" Procedure
hi def link oberonProcKwd     Keyword
hi def link oberonProcFwd     Operator
hi def link oberonProcName    Function

" Other keywords
hi def link oberonKwd         Keyword

" END … name . or ;
hi def link oberonEnd         Keyword
hi def link oberonEndName     Function
hi def link oberonEndDot      Delimiter
hi def link oberonEndSemi     Delimiter

" Identifier (catch-all)
hi def link oberonIdent       Identifier

" Errors
hi def link oberonError       Error

let b:current_syntax = "oberon"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8 noet: