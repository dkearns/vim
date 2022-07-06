" Vim syntax file
" Language:	GDB command files
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" URL:		http://www.fleiner.com/vim/syntax/gdb.vim
" Last Change:	2021 Nov 15
"		Additional changes by Simon Sobisch

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Commands

" breakpoints
syn keyword gdbStatement contained aw[atch]
syn match   gdbStatement contained "\<b\%[reak]\>"
syn match   gdbStatement contained "\<break-\%(\%[range]\>\)\="
syn keyword gdbStatement contained cat[ch]
syn keyword gdbStatement contained cl[ear] cl

" TODO: handle specially
" syn keyword gdbStatement contained comm[ands]
syn region  gdbMultilineStatement contained matchgroup=gdbStatement start="\<comm\%[ands]\>" end="^\s*\zsend\ze\s*$" contains=TOP transparent fold

syn keyword gdbStatement contained cond[ition]
syn keyword gdbStatement contained de[lete] del d
syn keyword gdbStatement contained dis[able] disa dis
syn keyword gdbStatement contained dp[rintf]
syn keyword gdbStatement contained e[nable] en
syn keyword gdbStatement contained ft[race]
syn keyword gdbStatement contained hb[reak]
syn keyword gdbStatement contained ig[nore]
syn keyword gdbStatement contained rb[reak]
syn keyword gdbStatement contained rw[atch]
syn keyword gdbStatement contained save
syn keyword gdbStatement contained sk[ip]
syn keyword gdbStatement contained str[ace]
syn keyword gdbStatement contained tb[reak]
syn keyword gdbStatement contained tc[atch]
syn keyword gdbStatement contained thb[reak]
syn keyword gdbStatement contained tr[ace] tp
syn keyword gdbStatement contained wa[tch]

" data 
syn match   gdbStatement contained "\<ag\%[ent-printf]\>"
syn keyword gdbStatement contained app[end]
syn keyword gdbStatement contained ca[ll]
syn keyword gdbStatement contained disas[semble]
syn keyword gdbStatement contained disp[lay]
syn keyword gdbStatement contained du[mp]
syn keyword gdbStatement contained find
syn match   gdbStatement contained "\<in\%[it-if-undefined]\>"
syn keyword gdbStatement contained mem
syn match   gdbStatement contained "\<memo\%[ry-tag]\>"
syn keyword gdbStatement contained ou[tput]
syn match   gdbStatement contained "\<\%(pr\%[int]\|ins\%[pect]\|p\)\>"
syn match   gdbStatement contained "\<\%(print-\%[object]\|po\)\>"
syn keyword gdbStatement contained printf
syn keyword gdbStatement contained pt[ype]
syn keyword gdbStatement contained resto[re]

" TODO: handle specially
" syn keyword gdbStatement contained set
syn keyword gdbStatement contained set nextgroup=gdbSet skipwhite

syn keyword gdbStatement contained und[isplay]
syn keyword gdbStatement contained wha[tis]
syn keyword gdbStatement contained wit[h] w
syn keyword gdbStatement contained x

" files
syn match   gdbStatement contained "\<add-symbol-file\>"
syn match   gdbStatement contained "\<add-symbol-file-\%[from-memory]\>"
syn keyword gdbStatement contained cd
syn match   gdbStatement contained "\<co\%[re-file]\>"
syn keyword gdbStatement contained dir[ectory]
syn keyword gdbStatement contained ed[it]
syn match   gdbStatement contained "\<exe\%[c-file]\>"
syn keyword gdbStatement contained fil[e]
syn match   gdbStatement contained "\<\%(for\%[ward-search]\|fo\|sea\%[rch]\)\>"
syn match   gdbStatement contained "\<\%(ge\%[nerate-core-file]\|gc\%[ore]\)\>"
syn keyword gdbStatement contained li[st] l
syn keyword gdbStatement contained lo[ad]
syn keyword gdbStatement contained no[sharedlibrary]
syn keyword gdbStatement contained pat[h]
syn keyword gdbStatement contained pw[d]
syn keyword gdbStatement contained remot[e]
syn match   gdbStatement contained "\<remove-s\%[ymbol-file]\>"
syn match   gdbStatement contained "\<\%(reverse-se\%[arch]\|rev\)\>"
syn keyword gdbStatement contained sec[tion]
syn keyword gdbStatement contained sha[redlibrary]
syn match   gdbStatement contained "\<sy\%[mbol-file]\>"

" internals
syn keyword gdbStatement contained mai[ntenance] mt

" obscure
syn keyword gdbStatement contained ch[eckpoint]
syn match gdbStatement contained "\<compa\%[re-sections]\>"
syn keyword gdbStatement contained compi[le] exp[ression]
syn keyword gdbStatement contained compl[ete]

" Guile
syn include @gdbGuile syntax/scheme.vim
unlet b:current_syntax
syn match   gdbStatement contained "\<guile-repl\>"
syn keyword gdbStatement contained gr
syn region  gdbStatement contained matchgroup=gdbStatement start="\<gu\%(ile\)\=\ze\s" skip="\\$" end="$" contains=@gdbGuile keepend transparent fold
syn region  gdbMultilineStatement contained matchgroup=gdbStatement start="\<gu\%(ile\)\=\ze\s*$" end="^\s*\zsend\ze\s*$" contains=@gdbGuile transparent fold

syn keyword gdbStatement contained mo[nitor]

" Python
syn include @gdbPython syntax/python.vim
unlet b:current_syntax
syn region gdbStatement contained matchgroup=gdbStatement start="\<py\%(thon\)\=\ze\s" start="\<\%(python-interactive\|pi\)\ze\s" skip="\\$" end="$" contains=@gdbPython keepend transparent fold
syn region gdbMultilineStatement contained matchgroup=gdbStatement start="\<py\%(thon\)\=\ze\s*$" end="^\s*\zsend\ze\s*$" contains=@gdbPython transparent fold
syn match  gdbStatement contained "\<\%(python-interactive\|pi\)\s*$"

syn keyword gdbStatement contained rec[ord] rec
syn keyword gdbStatement contained resta[rt]
syn keyword gdbStatement contained sto[p]

" running
syn keyword gdbStatement contained adv[ance]
syn keyword gdbStatement contained at[tach]
syn keyword gdbStatement contained cont[inue] fg c
syn keyword gdbStatement contained det[ach]
syn keyword gdbStatement contained disc[onnect]
syn keyword gdbStatement contained fini[sh] fin
syn keyword gdbStatement contained ha[ndle]
syn keyword gdbStatement contained infe[rior]
syn keyword gdbStatement contained interr[upt]
syn keyword gdbStatement contained ju[mp] j
syn keyword gdbStatement contained k[ill]
syn keyword gdbStatement contained next n
syn keyword gdbStatement contained nexti ni
syn match   gdbStatement contained "\<que\%[ue-signal]\>"
syn match   gdbStatement contained "\<\%(reverse-c\%[ontinue]\|rc\)\>"
syn match   gdbStatement contained "\<reverse-f\%[inish]\>"
syn match   gdbStatement contained "\<\%(reverse-next\|rn\)\>"
syn match   gdbStatement contained "\<\%(reverse-nexti\|rni\)\>"
syn match   gdbStatement contained "\<\%(reverse-step\|rs\)\>"
syn match   gdbStatement contained "\<\%(reverse-stepi\|rsi\)\>"
syn keyword gdbStatement contained ru[n] r
syn keyword gdbStatement contained sig[nal]
syn keyword gdbStatement contained start s
syn keyword gdbStatement contained starti si
syn keyword gdbStatement contained step s
syn keyword gdbStatement contained stepi si
syn keyword gdbStatement contained taa[s]
syn keyword gdbStatement contained tar[get]
syn keyword gdbStatement contained tas[k]
syn keyword gdbStatement contained tfa[as]
syn keyword gdbStatement contained thr[ead] t
syn keyword gdbStatement contained unt[il] u

" stack
syn keyword gdbStatement contained ba[cktrace] whe[re] bt
syn keyword gdbStatement contained do[wn]
syn keyword gdbStatement contained fa[as]
syn keyword gdbStatement contained fr[ame] f
syn keyword gdbStatement contained ret[urn]
syn match   gdbStatement contained "\<sel\%[ect-frame]\>"
syn keyword gdbStatement contained up

" status

" TODO: handle specially
" syn keyword gdbStatement contained info inf i
syn keyword gdbStatement contained info inf i nextgroup=gdbInfo skipwhite

syn keyword gdbStatement contained mac[ro]
" TODO: info set
syn keyword gdbStatement contained sho[w]

" support
syn match   gdbStatement contained "\<add-auto-load-sa\%[fe-path]\>"
syn match   gdbStatement contained "\<add-auto-load-sc\%[ripts-directory]\>"

" TODO: handle specially
" syn keyword gdbStatement contained al[ias]
syn keyword gdbStatement   contained al[ias]            nextgroup=gdbAliasName   skipwhite
syn match   gdbAliasName   contained "\<\%(\w\|-\)\+\>" nextgroup=gdbAliasEquals skipwhite
syn match   gdbAliasEquals contained "="                nextgroup=@gdbStatements skipwhite
hi def link gdbAliasName Function

syn keyword gdbStatement contained apr[opos]

" TODO: handle specially
"     : optionally highlight define/end as normal commands and only the
"	command name with HL group Function
" syn keyword gdbStatement contained def[ine]
syn region  gdbDefine	 contained matchgroup=gdbFuncDef start="\<def\%[ine]\>.*" end="\%(^\s*\)\@<=end\ze\s*$" contains=TOP transparent fold

syn match   gdbStatement contained "\<define-\%(\%[prefix]\>\)\="
syn keyword gdbStatement contained dem[angle]

" TODO: handle specially
" syn keyword gdbStatement contained doc\%[ument]
syn region  gdbDocument  contained matchgroup=gdbFuncDef start="\<doc\%[ument]\>.*$" end="^\s*\zsend\ze\s*$" fold

syn match   gdbStatement contained "\<don\%[t-repeat]\>"
syn match   gdbStatement contained "\<down-\%[silently]\>"
syn keyword gdbStatement contained ec[ho]
syn keyword gdbStatement contained he[lp] h

" TODO: handle specially
" syn keyword gdbStatement contained if else
syn region gdbIf contained matchgroup=gdbStatement start="\<if\>" end="\%(^\s*\)\@<=end\ze\s*$" contains=TOP transparent fold
syn keyword gdbStatement contained else containedin=gdbIf

syn match   gdbStatement contained "\<interp\%[reter-exec]\>"
syn keyword gdbStatement contained mak[e]
syn match   gdbStatement contained "\<new\%[-ui]\>"
syn keyword gdbStatement contained ov[erlay] ov ovly
syn keyword gdbStatement contained pi[pe]
syn match   gdbStatement contained "|"
syn keyword gdbStatement contained qui[t] exi[t] q
syn keyword gdbStatement contained she[ll]
syn match   gdbStatement contained "!"
syn keyword gdbStatement contained so[urce]
syn match   gdbStatement contained "\<up-\%[silently]\>"

" TODO: handle specially
" syn match   gdbStatement contained "\<whi\%[le]\>"
" syn keyword gdbStatement contained loop_break loop_continue
syn region gdbWhile contained matchgroup=gdbStatement start="\<whi\%[le]\>" end="\%(^\s*\)\@<=end\ze\s*$" contains=TOP transparent fold
syn keyword gdbStatement contained loop_break loop_continue containedin=gdbWhile

" text-user-interface
syn match   gdbStatement contained "[<>+-]"
syn keyword gdbStatement contained foc[us] fs
syn keyword gdbStatement contained la[yout]
syn keyword gdbStatement contained ref[resh]
syn keyword gdbStatement contained tu[i]
syn keyword gdbStatement contained upd[ate]
syn keyword gdbStatement contained win[height] wh

" tracepoints
syn keyword gdbStatement contained ac[tions]
syn keyword gdbStatement contained col[lect]
syn keyword gdbStatement contained end
syn keyword gdbStatement contained pas[scount]
syn keyword gdbStatement contained t[dump]
syn keyword gdbStatement contained tev[al]
syn keyword gdbStatement contained tfi[nd]
syn keyword gdbStatement contained tsa[ve]
syn keyword gdbStatement contained tstar[t]
syn keyword gdbStatement contained tstat[us]
syn keyword gdbStatement contained tsto[p]
syn keyword gdbStatement contained tv[ariable]
syn match   gdbStatement contained "\<\%(while-stepping\|stepp\%[ing]\|ws\)\>"

" unclassified
syn match   gdbStatement contained "\<add-i\%[nferior]\>"
syn match   gdbStatement contained "\<clo\%[ne-inferior]\>"
syn keyword gdbStatement contained ev[al]
syn match   gdbStatement contained "\<fl\%[ash-erase]\>"
syn keyword gdbStatement contained fu[nction]
syn match   gdbStatement contained "\<jit-reader-l\%[oad]\>"
syn match   gdbStatement contained "\<jit-reader-u\%[nload]\>"
syn match   gdbStatement contained "\<remove-i\%[nferiors]\>"
syn keyword gdbStatement contained uns[et]

syn keyword gdbStatement contained bo[okmark]
syn match   gdbStatement contained "\<go\%[to-bookmark]\>"

syn keyword gdbPrefix contained server nextgroup=gdbStatement skipwhite

syn cluster gdbStatements contains=gdbStatement,gdbMultilineStatement,gdbDefine,gdbDocument,gdbIf,gdbWhile,gdbPrefix

syn match gdbStatementAnchor "^" nextgroup=@gdbStatements skipwhite
syn match gdbLineContinuation "\\$"

syn keyword gdbInfo contained address args auxv bookmarks breakpoints b checkpoints classes common connections copying dcache
syn keyword gdbInfo contained display exceptions extensions files float frame f functions guile gu inferiors line locals macro
syn keyword gdbInfo contained macros mem module modules os probes proc program record rec registers r scope selectors set
syn keyword gdbInfo contained sharedlibrary dll signals handle skip source sources stack s symbol target tasks terminal threads
syn keyword gdbInfo contained tracepoints tvariables types variables vector vtbl warranty watchpoints win
syn match gdbInfo contained "\<all-registers\>"
syn match gdbInfo contained "\<auto-load\>"
syn match gdbInfo contained "\<static-tracepoint-markers\>"
" obsolete?
syn keyword gdbInfo contained architecture catch udot

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
hi def link gdbFuncDef		Function
hi def link gdbComment		Comment
hi def link gdbStatement	Statement
hi def link gdbPrefix		gdbStatement
hi def link gdbString		String
hi def link gdbCharacter	Character
hi def link gdbVariable		Identifier
hi def link gdbSet		Constant
hi def link gdbInfo		Type
hi def link gdbDocument		Special
hi def link gdbNumber		Number
hi def link gdbLineContinuation	Special

let b:current_syntax = "gdb"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
