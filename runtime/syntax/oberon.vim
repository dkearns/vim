" Vim syntax file
" Language:    Oberon
" Maintainer:  Vim Project
" Last Change: 2024 Jan 04

" Oberon is a programming language designed by Niklaus Wirth in the late 1980s
" as a successor to Modula-2. It's a systems programming language with object-oriented features.

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" -----------------------------------------------------------------------------
" Reserved Words
" -----------------------------------------------------------------------------
syn keyword oberonResword ARRAY BEGIN BY CASE CONST DIV DO ELSE ELSIF END
syn keyword oberonResword FOR IF IMPORT IN IS MOD MODULE NIL OF OR
syn keyword oberonResword POINTER PROCEDURE RECORD REPEAT RETURN THEN TO
syn keyword oberonResword TYPE UNTIL VAR WHILE WITH

" -----------------------------------------------------------------------------
" Builtin Constants
" -----------------------------------------------------------------------------
syn keyword oberonConstant TRUE FALSE NIL

" -----------------------------------------------------------------------------
" Builtin Types  
" -----------------------------------------------------------------------------
syn keyword oberonType BOOLEAN CHAR INTEGER REAL SET LONGINT LONGREAL

" -----------------------------------------------------------------------------
" Builtin Procedures and Functions
" -----------------------------------------------------------------------------
syn keyword oberonFunction ABS ASH CAP CHR DEC ENTIER HALT INC LEN LONG
syn keyword oberonFunction MAX MIN ODD ORD SHORT SIZE

" System procedures
syn keyword oberonSysFunc ADR BIT CC COPY GET LSH PUT ROT SIZE VAL

" -----------------------------------------------------------------------------
" Operators
" -----------------------------------------------------------------------------
syn match oberonOperator "\V+"
syn match oberonOperator "\V-"
syn match oberonOperator "\V*"
syn match oberonOperator "\V/"
syn match oberonOperator "\V="
syn match oberonOperator "\V#"
syn match oberonOperator "\V<"
syn match oberonOperator "\V>"
syn match oberonOperator "\V<="
syn match oberonOperator "\V>="
syn match oberonOperator "\V&"
syn match oberonOperator "\V~"
syn match oberonOperator "\V:="
syn match oberonOperator "\V\."
syn match oberonOperator "\V,"
syn match oberonOperator "\V;"
syn match oberonOperator "\V:"
syn match oberonOperator "\V^"

" Delimiters
syn match oberonDelimiter "\V("
syn match oberonDelimiter "\V)"
syn match oberonDelimiter "\V["
syn match oberonDelimiter "\V]"
syn match oberonDelimiter "\V{"
syn match oberonDelimiter "\V}"

" -----------------------------------------------------------------------------
" Identifiers
" -----------------------------------------------------------------------------
syn match oberonIdent "\<[a-zA-Z][a-zA-Z0-9]*\>"

" -----------------------------------------------------------------------------
" String Literals
" -----------------------------------------------------------------------------
syn region oberonString start=/"/ end=/"/ oneline contains=oberonStringEscape
syn region oberonString start=/'/ end=/'/ oneline contains=oberonStringEscape
syn match oberonStringEscape contained /""/ 
syn match oberonStringEscape contained /''/

" -----------------------------------------------------------------------------
" Character Literals
" -----------------------------------------------------------------------------
syn match oberonChar /\d\+X/ " Hexadecimal character literals

" -----------------------------------------------------------------------------
" Numeric Literals
" -----------------------------------------------------------------------------
" Decimal integers
syn match oberonNumber "\<[0-9]\+\>"
" Hexadecimal integers  
syn match oberonHexNumber "\<[0-9A-F]\+H\>"
" Real numbers
syn match oberonReal "\<[0-9]\+\.[0-9]*\([eE][+-]\?[0-9]\+\)\?\>"
syn match oberonReal "\<[0-9]\+[eE][+-]\?[0-9]\+\>"

" -----------------------------------------------------------------------------
" Comments
" -----------------------------------------------------------------------------
syn region oberonComment start="(\*" end="\*)" contains=oberonComment,oberonTodo
syn keyword oberonTodo contained TODO FIXME XXX NOTE

" -----------------------------------------------------------------------------
" Module Structure
" -----------------------------------------------------------------------------
syn match oberonModuleIdent "\<[A-Z][a-zA-Z0-9]*\>" contained
syn match oberonModuleHeader "^\s*MODULE\s\+[A-Z][a-zA-Z0-9]*" contains=oberonResword,oberonModuleIdent
syn match oberonModuleTail "^\s*END\s\+[A-Z][a-zA-Z0-9]*\s*\.$" contains=oberonResword,oberonModuleIdent

" Procedure headers
syn match oberonProcIdent "\<[a-zA-Z][a-zA-Z0-9]*\>" contained
syn match oberonProcHeader "^\s*PROCEDURE\s\+[a-zA-Z][a-zA-Z0-9]*" contains=oberonResword,oberonProcIdent

" -----------------------------------------------------------------------------
" Error highlighting for common mistakes
" -----------------------------------------------------------------------------
syn match oberonError "\$\|?\|!"

" -----------------------------------------------------------------------------
" Define Highlighting
" -----------------------------------------------------------------------------
hi def link oberonResword         Keyword
hi def link oberonConstant        Constant
hi def link oberonType            Type
hi def link oberonFunction        Function
hi def link oberonSysFunc         Function
hi def link oberonOperator        Operator
hi def link oberonDelimiter       Delimiter
hi def link oberonIdent           Identifier
hi def link oberonModuleIdent     Function
hi def link oberonProcIdent       Function
hi def link oberonString          String
hi def link oberonStringEscape    Special
hi def link oberonChar            Character
hi def link oberonNumber          Number
hi def link oberonHexNumber       Number
hi def link oberonReal            Float
hi def link oberonComment         Comment
hi def link oberonTodo            Todo
hi def link oberonError           Error

let b:current_syntax = "oberon"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8 noet: