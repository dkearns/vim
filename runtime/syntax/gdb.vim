" Vim syntax file
" Language:	GDB command files
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" URL:		http://www.fleiner.com/vim/syntax/gdb.vim
" Last Change:	2021 Nov 15
" 		Additional changes by Simon Sobisch

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn keyword gdbInfo contained address args auxv bookmarks breakpoints b checkpoints classes common connections copying dcache
syn keyword gdbInfo contained display exceptions extensions files float frame f functions guile gu inferiors line locals macro
syn keyword gdbInfo contained macros mem module modules os probes proc program record rec registers r scope selectors set
syn keyword gdbInfo contained sharedlibrary dll signals handle skip source sources stack s symbol target tasks terminal threads
syn keyword gdbInfo contained tracepoints tvariables types variables vector vtbl warranty watchpoints win
syn match gdbInfo contained "\<all-registers\>"
syn match gdbInfo contained "\<auto-load\>"
syn match gdbInfo contained "\<static-tracepoint-markers\>"
" obsolete?
syn keyword gdbInfo architecture catch udot

syn keyword gdbStatement contained actions apply attach awatch backtrace break bt call catch cd clear collect commands
syn keyword gdbStatement contained complete condition continue delete detach directory disable disas[semble] disp[lay] down
syn keyword gdbStatement contained echo else enable end file finish frame handle hbreak help if ignore
syn keyword gdbStatement contained inspect jump kill list load maintenance make next nexti ni output overlay
syn keyword gdbStatement contained passcount path print printf ptype pwd quit rbreak remote return run rwatch
syn keyword gdbStatement contained search section sharedlibrary shell show si signal skip source step stepi stepping
syn keyword gdbStatement contained stop target tbreak tdump tfind thbreak thread tp trace tstart tstatus tstop
syn keyword gdbStatement contained tty und[isplay] unset until up watch whatis where while ws x
syn match gdbFuncDef "\<define\>.*"
syn match gdbStatementAnchor "^" nextgroup=gdbStatement,gdbMultilineStatement,gdbFuncDef,gdbPrefix skipwhite
syn keyword gdbStatement contained set  nextgroup=gdbSet  skipwhite
syn keyword gdbStatement contained info nextgroup=gdbInfo skipwhite

syn keyword gdbPrefix contained server nextgroup=gdbStatement skipwhite

" some commonly used abbreviations
syn keyword gdbStatement c cont p

syn region gdbDocument matchgroup=gdbFuncDef start="\<document\>.*$" matchgroup=gdbFuncDef end="^end\s*$"

" Guile
syn include @gdbGuile syntax/scheme.vim
unlet b:current_syntax
syn match   gdbStatement contained "\<guile-repl\>"
syn keyword gdbStatement contained gr
syn region  gdbStatement contained matchgroup=gdbStatement start="\<gu\%(ile\)\=\ze\s" skip="\\$" end="$" contains=@gdbGuile keepend transparent fold
syn region  gdbMultilineStatement contained matchgroup=gdbStatement start="\<gu\%(ile\)\=\ze\s*$" end="^\s*\zsend\ze\s*$" contains=@gdbGuile transparent fold

" Python
syn include @gdbPython syntax/python.vim
unlet b:current_syntax
syn region gdbStatement contained matchgroup=gdbStatement start="\<py\%(thon\)\=\ze\s" start="\<\%(python-interactive\|pi\)\ze\s" skip="\\$" end="$" contains=@gdbPython keepend transparent fold
syn region gdbMultilineStatement contained matchgroup=gdbStatement start="\<py\%(thon\)\=\ze\s*$" end="^\s*\zsend\ze\s*$" contains=@gdbPython transparent fold
syn match  gdbStatement contained "\<\%(python-interactive\|pi\)\s*$"

syn match gdbStatement "\<add-shared-symbol-files\>"
syn match gdbStatement "\<add-symbol-file\>"
syn match gdbStatement "\<core-file\>"
syn match gdbStatement "\<dont-repeat\>"
syn match gdbStatement "\<down-silently\>"
syn match gdbStatement "\<exec-file\>"
syn match gdbStatement "\<forward-search\>"
syn match gdbStatement "\<reverse-search\>"
syn match gdbStatement "\<save-tracepoints\>"
syn match gdbStatement "\<select-frame\>"
syn match gdbStatement "\<symbol-file\>"
syn match gdbStatement "\<up-silently\>"
syn match gdbStatement "\<while-stepping\>"

syn keyword gdbSet contained ada agent annotate architecture processor args backtrace breakpoint charset check ch c complaints
syn keyword gdbSet contained confirm cwd dcache debug debuginfod directories editing endian environment fortran gnutarget g guile gu
syn keyword gdbSet contained height history language listsize logging mem mpx observer osabi pagination print pr p prompt python
syn keyword gdbSet contained radix ravenscar record rec remote remoteaddresssize remotecache remoteflow remotelogbase remotelogfile
syn keyword gdbSet contained remotetimeout remotewritesize serial source style sysroot targetdebug tcp tdesc tui variable var
syn keyword gdbSet contained verbose watchdog width write

" obsolete
syn keyword gdbSet contained remotebaud remotebreak remotedebug remotedevice

syn match gdbSet contained "\<auto-connect-native-target\>"
syn match gdbSet contained "\<auto-load\>"
syn match gdbSet contained "\<auto-solib-add\>"
syn match gdbSet contained "\<basenames-may-differ\>"
syn match gdbSet contained "\<can-use-hw-watchpoints\>"
syn match gdbSet contained "\<case-sensitive\>"
syn match gdbSet contained "\<circular-trace-buffer\>"
syn match gdbSet contained "\<code-cache\>"
syn match gdbSet contained "\<coerce-float-to-double\>"
syn match gdbSet contained "\<compile-args\>"
syn match gdbSet contained "\<compile-gcc\>"
syn match gdbSet contained "\<cp-abi\>"
syn match gdbSet contained "\<data-directory\>"
syn match gdbSet contained "\<debug-file-directory\>"
syn match gdbSet contained "\<default-collect\>"
syn match gdbSet contained "\<demangle-style\>"
syn match gdbSet contained "\<detach-on-fork\>"
syn match gdbSet contained "\<disable-randomization\>"
syn match gdbSet contained "\<disable-randomization\>"
syn match gdbSet contained "\<disassemble-next-line\>"
syn match gdbSet contained "\<disassembler-options\>"
syn match gdbSet contained "\<disassembly-flavor\>"
syn match gdbSet contained "\<disconnected-dprintf\>"
syn match gdbSet contained "\<disconnected-tracing\>"
syn match gdbSet contained "\<displaced-stepping\>"
syn match gdbSet contained "\<dprintf-channel\>"
syn match gdbSet contained "\<dprintf-function\>"
syn match gdbSet contained "\<dprintf-style\>"
syn match gdbSet contained "\<dump-excluded-mappings\>"
syn match gdbSet contained "\<exec-direction\>"
syn match gdbSet contained "\<exec-done-display\>"
syn match gdbSet contained "\<exec-file-mismatch\>"
syn match gdbSet contained "\<exec-wrapper\>"
syn match gdbSet contained "\<extension-language\>"
syn match gdbSet contained "\<filename-display\>"
syn match gdbSet contained "\<follow-exec-mode\>"
syn match gdbSet contained "\<follow-fork-mode\>"
syn match gdbSet contained "\<follow-fork-mode\>"
syn match gdbSet contained "\<host-charset\>"
syn match gdbSet contained "\<index-cache\>"
syn match gdbSet contained "\<inferior-tty\|tty\>"
syn match gdbSet contained "\<input-radix\>"
syn match gdbSet contained "\<interactive-mode\>"
syn match gdbSet contained "\<libthread-db-search-path\>"
syn match gdbSet contained "\<max-completions\>"
syn match gdbSet contained "\<max-user-call-depth\>"
syn match gdbSet contained "\<max-value-size\>"
syn match gdbSet contained "\<may-call-functions\>"
syn match gdbSet contained "\<may-insert-breakpoints\>"
syn match gdbSet contained "\<may-insert-fast-tracepoints\>"
syn match gdbSet contained "\<may-insert-tracepoints\>"
syn match gdbSet contained "\<may-interrupt\>"
syn match gdbSet contained "\<may-write-memory\>"
syn match gdbSet contained "\<may-write-registers\>"
syn match gdbSet contained "\<mi-async\>"
syn match gdbSet contained "\<multiple-symbols\>"
syn match gdbSet contained "\<non-stop\>"
syn match gdbSet contained "\<opaque-type-resolution\>"
syn match gdbSet contained "\<output-radix\>"
syn match gdbSet contained "\<overload-resolution\>"
syn match gdbSet contained "\<range-stepping\>"
syn match gdbSet contained "\<schedule-multiple\>"
syn match gdbSet contained "\<scheduler-locking\>"
syn match gdbSet contained "\<script-extension\>"
syn match gdbSet contained "\<solib-absolute-prefix\>"
syn match gdbSet contained "\<solib-search-path\>"
syn match gdbSet contained "\<stack-cache\>"
syn match gdbSet contained "\<startup-quietly\>"
syn match gdbSet contained "\<startup-with-shell\>"
syn match gdbSet contained "\<step-mode\>"
syn match gdbSet contained "\<stop-on-solib-events\>"
syn match gdbSet contained "\<struct-convention\>"
syn match gdbSet contained "\<substitute-path\>"
syn match gdbSet contained "\<suppress-cli-notifications\>"
syn match gdbSet contained "\<target-charset\>"
syn match gdbSet contained "\<target-file-system-kind\>"
syn match gdbSet contained "\<target-wide-charset\>"
syn match gdbSet contained "\<trace-buffer-size\>"
syn match gdbSet contained "\<trace-commands\>"
syn match gdbSet contained "\<trace-notes\>"
syn match gdbSet contained "\<trace-stop-notes\>"
syn match gdbSet contained "\<trace-user\>"
syn match gdbSet contained "\<trust-readonly-sections\>"
syn match gdbSet contained "\<unwindonsignal\>"
syn match gdbSet contained "\<unwind-on-terminating-exception\>"
syn match gdbSet contained "\<use-coredump-filter\>"
syn match gdbSet contained "\<use-deprecated-index-sections\>"

" obsolete?
syn match gdbSet contained "\<symbol-reloading\>"

syn match gdbComment "^\s*#.*" contains=@Spell

syn match gdbVariable "\$\K\k*"

" Strings and constants
syn region  gdbString		start=+"+  skip=+\\\\\|\\"+  end=+"+ contains=@Spell
syn match   gdbCharacter	"'[^']*'" contains=gdbSpecialChar,gdbSpecialCharError
syn match   gdbCharacter	"'\\''" contains=gdbSpecialChar
syn match   gdbCharacter	"'[^\\]'"
syn match   gdbNumber		"\<[0-9_]\+\>"
syn match   gdbNumber		"\<0x[0-9a-fA-F_]\+\>"


if !exists("gdb_minlines")
  let gdb_minlines = 10
endif
exec "syn sync ccomment gdbComment minlines=" . gdb_minlines

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link gdbFuncDef	Function
hi def link gdbComment	Comment
hi def link gdbStatement	Statement
hi def link gdbPrefix	gdbStatement
hi def link gdbString	String
hi def link gdbCharacter	Character
hi def link gdbVariable	Identifier
hi def link gdbSet		Constant
hi def link gdbInfo	Type
hi def link gdbDocument	Special
hi def link gdbNumber	Number

let b:current_syntax = "gdb"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
