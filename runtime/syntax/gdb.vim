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
syn keyword gdbStatement contained cat[ch] nextgroup=gdbCatchArgs skipwhite
syn keyword gdbStatement contained cl[ear] cl

" TODO: handle specially
" syn keyword gdbStatement contained comm[ands]
syn region  gdbMultilineStatement contained matchgroup=gdbStatement start="\<comm\%[ands]\>" end="^\s*\zsend\ze\s*$" contains=TOP transparent fold

syn keyword gdbStatement contained cond[ition]
syn keyword gdbStatement contained de[lete] del d nextgroup=gdbDeleteArgs skipwhite
syn keyword gdbStatement contained dis[able] disa dis nextgroup=gdbDisableArgs skipwhite
syn keyword gdbStatement contained dp[rintf]
syn keyword gdbStatement contained e[nable] en nextgroup=gdbEnableArgs skipwhite
syn keyword gdbStatement contained ft[race]
syn keyword gdbStatement contained hb[reak]
syn keyword gdbStatement contained ig[nore]
syn keyword gdbStatement contained rb[reak]
syn keyword gdbStatement contained rw[atch]
syn keyword gdbStatement contained save nextgroup=gdbSaveArgs skipwhite
syn keyword gdbStatement contained sk[ip] nextgroup=gdbSkipArgs skipwhite
syn keyword gdbStatement contained str[ace]
syn keyword gdbStatement contained tb[reak]
syn keyword gdbStatement contained tc[atch]
syn keyword gdbStatement contained tc[atch] nextgroup=gdbCatchArgs skipwhite
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
syn keyword gdbStatement contained set nextgroup=gdbSetArgs skipwhite
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

syn keyword gdbStatement contained info inf i nextgroup=gdbInfoArgs skipwhite
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
syn keyword gdbStatement contained ov[erlay] ov ovly nextgroup=gdbOverlayArgs skipwhite
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
syn keyword gdbStatement contained la[yout] nextgroup=gdbLayoutArgs skipwhite
syn keyword gdbStatement contained ref[resh]
syn keyword gdbStatement contained tu[i] nextgroup=gdbTuiArgs skipwhite
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
syn keyword gdbStatement contained uns[et] nextgroup=gdbUnsetArgs skipwhite
syn keyword gdbStatement contained bo[okmark]
syn match   gdbStatement contained "\<go\%[to-bookmark]\>"

syn keyword gdbPrefix contained server nextgroup=gdbStatement skipwhite

syn cluster gdbStatements contains=gdbStatement,gdbMultilineStatement,gdbDefine,gdbDocument,gdbIf,gdbWhile,gdbPrefix

syn match gdbStatementAnchor "^" nextgroup=@gdbStatements skipwhite
syn match gdbLineContinuation "\\$"

syn keyword gdbCatchArgs contained assert catch exception exec fork handlers load rethrow signal syscall throw unload vfork

syn keyword gdbEnableArgs contained count delete display mem once probes
syn keyword gdbEnableArgs contained breakpoints nextgroup=gdbEnableBreakpointArgs skipwhite

syn keyword gdbEnableBreakpointArgs contained count delete once

syn keyword gdbDeleteArgs contained bookmark breakpoints checkpoint display mem tracepoints tr tvariable

syn keyword gdbDisableArgs contained breakpoints display mem probes

syn keyword gdbInfoArgs contained address args auxv bookmarks breakpoints b checkpoints classes common connections copying dcache
syn keyword gdbInfoArgs contained display exceptions extensions files float frame f functions guile gu inferiors line locals macro
syn keyword gdbInfoArgs contained macros mem module modules os probes proc program record rec registers r scope selectors set
syn keyword gdbInfoArgs contained sharedlibrary dll signals handle skip source sources stack s symbol target tasks terminal threads
syn keyword gdbInfoArgs contained tracepoints tvariables types variables vector vtbl warranty watchpoints win
syn match   gdbInfoArgs contained "\<all-registers\>"
syn match   gdbInfoArgs contained "\<auto-load\>"
syn match   gdbInfoArgs contained "\<static-tracepoint-markers\>"
" obsolete?
syn keyword gdbInfoArgs contained architecture catch udot

syn keyword gdbLayoutArgs contained asm next prev regs split src

syn keyword gdbOverlayArgs contained auto manual off
syn match   gdbOverlayArgs contained "\<list-overlays\>"
syn match   gdbOverlayArgs contained "\<load-target\>"
syn match   gdbOverlayArgs contained "\<map-overlay\>"
syn match   gdbOverlayArgs contained "\<unmap-overlay\>"

syn keyword gdbSaveArgs contained breakpoints gdb-index tracepoints
syn match   gdbSaveArgs contained "\<gdb-index\>"

syn keyword gdbSetArgs contained agent annotate architecture processor args charset ch c complaints confirm cwd directories editing
syn keyword gdbSetArgs contained endian environment gnutarget g height language listsize observer osabi pagination pr p prompt
syn keyword gdbSetArgs contained radix remoteaddresssize remotecache remoteflow remotelogbase remotelogfile remotetimeout
syn keyword gdbSetArgs contained remotewritesize sysroot targetdebug variable var verbose watchdog width write
" obsolete
" syn keyword gdbSetArgs contained remotebaud remotebreak remotedebug remotedevice

syn keyword gdbSetArgs contained ada nextgroup=gdbSetAdaArgs skipwhite

syn match gdbSetAdaArgs contained "\<print-signatures\>"
syn match gdbSetAdaArgs contained "\<source-charset\>"
syn match gdbSetAdaArgs contained "\<trust-PAD-over-XVS\>"

syn keyword gdbSetArgs contained backtrace nextgroup=gdbSetBacktraceArgs skipwhite
syn keyword gdbSetBacktraceArgs contained limit
syn match   gdbSetBacktraceArgs contained "\<past-entry\>"
syn match   gdbSetBacktraceArgs contained "\<past-main\>"

syn keyword gdbSetArgs contained breakpoint nextgroup=gdbSetBreakpointArgs skipwhite
syn keyword gdbSetBreakpointArgs contained pending
syn match   gdbSetBreakpointArgs contained "\<always-inserted\>"
syn match   gdbSetBreakpointArgs contained "\<auto-hw\>"
syn match   gdbSetBreakpointArgs contained "\<condition-evaluation\>"

syn keyword gdbSetArgs contained check nextgroup=gdbSetCheckArgs skipwhite
syn keyword gdbSetCheckArgs contained range type

syn keyword gdbSetArgs contained dcache nextgroup=gdbSetDcacheArgs skipwhite
syn keyword gdbSetDcacheArgs contained size
syn match   gdbSetDcacheArgs contained "\<line-size\>"

syn keyword gdbSetArgs contained debuginfod nextgroup=gdbSetDebuginfodArgs skipwhite
syn keyword gdbSetDebuginfodArgs contained enabled urls verbose

syn keyword gdbSetArgs contained fortran nextgroup=gdbSetFortranArgs skipwhite
syn match   gdbSetFortranArgs contained "\<repack-array-slices\>"

syn keyword gdbSetArgs contained guile gu nextgroup=gdbSetGuileArgs skipwhite
syn match   gdbSetGuileArgs contained "\<print-stack\>"

syn keyword gdbSetArgs contained history nextgroup=gdbSetHistoryArgs skipwhite
syn keyword gdbSetHistoryArgs contained expansion filename save size
syn match   gdbSetHistoryArgs contained "\<remove-duplicates\>"

syn keyword gdbSetArgs contained logging nextgroup=gdbSetLoggingArgs skipwhite
syn keyword gdbSetLoggingArgs contained debugredirect enabled file overwrite redirect

syn keyword gdbSetArgs contained mem nextgroup=gdbSetMemArgs skipwhite
syn match   gdbSetMemArgs contained "\<inaccessible-by-default\>"

syn keyword gdbSetArgs contained mpx nextgroup=gdbSetMpxArgs skipwhite
syn keyword gdbSetMpxArgs contained bound

syn keyword gdbSetArgs contained print nextgroup=gdbSetPrintArgs skipwhite
syn keyword gdbSetPrintArgs contained address demangle elements finish object pretty repeats union vtbl

syn keyword gdbSetPrintArgs contained type nextgroup=gdbSetPrintTypeArgs skipwhite
syn keyword gdbSetPrintTypeArgs contained hex methods typedefs
syn match   gdbSetPrintTypeArgs contained "\<nested-type-limit\>"

syn keyword gdbSetArgs contained python nextgroup=gdbSetPythonArgs skipwhite
syn match   gdbSetPythonArgs contained "\<dont-write-bytecode\>"
syn match   gdbSetPythonArgs contained "\<ignore-environment\>"
syn match   gdbSetPythonArgs contained "\<print-stack\>"

syn keyword gdbSetArgs contained ravenscar nextgroup=gdbSetRavenscarArgs skipwhite
syn match   gdbSetRavenscarArgs contained "\<task-switching\>"

syn keyword gdbSetArgs contained record nextgroup=gdbSetRecordArgs skipwhite
syn keyword gdbSetRecordArgs contained btrace nextgroup=gdbSetRecordBtraceArgs skipwhite
syn keyword gdbSetRecordBtraceArgs contained bts nextgroup=gdbSetRecordBtraceBtsArgs skipwhite
syn match   gdbSetRecordBtraceBtsArgs contained "\<buffer-size\>"
syn keyword gdbSetRecordBtraceArgs contained cpu nextgroup=gdbSetRecordBtraceCpuArgs skipwhite
syn keyword gdbSetRecordBtraceCpuArgs contained auto none
syn keyword gdbSetRecordBtraceArgs contained pt nextgroup=gdbSetRecordBtracePtArgs skipwhite
syn match   gdbSetRecordBtracePtArgs contained "\<buffer-size\>"
syn match   gdbSetRecordBtraceArgs contained "\<replay-memory-access\>"
syn keyword gdbSetRecordArgs contained full nextgroup=gdbSetRecordFullArgs skipwhite
syn match   gdbSetRecordFullArgs contained "\<insn-number-max\>"
syn match   gdbSetRecordFullArgs contained "\<memory-query\>"
syn match   gdbSetRecordFullArgs contained "\<stop-at-limit\>"
syn match   gdbSetRecordArgs contained "\<function-call-history-size\>"
syn match   gdbSetRecordArgs contained "\<instruction-history-size\>"

syn keyword gdbSetArgs contained serial nextgroup=gdbSetSerialArgs skipwhite
syn keyword gdbSetSerialArgs contained baud parity

syn keyword gdbSetArgs contained source nextgroup=gdbSetSourceArgs skipwhite
syn keyword gdbSetSourceArgs contained open

syn keyword gdbSetArgs contained style nextgroup=gdbSetStyleArgs skipwhite
syn keyword gdbSetStyleArgs contained address nextgroup=gdbSetStyleAddressArgs skipwhite
syn keyword gdbSetStyleAddressArgs contained background foreground intensity
syn keyword gdbSetStyleArgs contained disassembler nextgroup=gdbSetStyleDissassemblerArgs skipwhite
syn keyword gdbSetStyleDissassemblerArgs contained enabled
syn keyword gdbSetStyleArgs contained enabled
syn keyword gdbSetStyleArgs contained filename nextgroup=gdbSetStyleFilenameArgs skipwhite
syn keyword gdbSetStyleFilenameArgs contained background foreground intensity
syn keyword gdbSetStyleArgs contained function nextgroup=gdbSetStyleFunctionArgs skipwhite
syn keyword gdbSetStyleFunctionArgs contained background foreground intensity
syn keyword gdbSetStyleArgs contained highlight nextgroup=gdbSetStyleHighlightArgs skipwhite
syn keyword gdbSetStyleHighlightArgs contained background foreground intensity
syn keyword gdbSetStyleArgs contained metadata nextgroup=gdbSetStyleMetadataArgs skipwhite
syn keyword gdbSetStyleMetadataArgs contained background foreground intensity
syn keyword gdbSetStyleArgs contained sources
syn keyword gdbSetStyleArgs contained title nextgroup=gdbSetStyleTitleArgs skipwhite
syn keyword gdbSetStyleTitleArgs contained background foreground intensity
syn match   gdbSetStyleArgs contained "\<tui-active-border\>" nextgroup=gdbSetStyleTuiActiveBorderArgs skipwhite
syn keyword gdbSetStyleTuiActiveBorderArgs contained background foreground intensity
syn match   gdbSetStyleArgs contained "\<tui-border\>" nextgroup=gdbSetStyleTuiBorderArgs skipwhite
syn keyword gdbSetStyleTuiBorderArgs contained background foreground intensity
syn keyword gdbSetStyleArgs contained variable nextgroup=gdbSetStyleVariableArgs skipwhite
syn keyword gdbSetStyleVariableArgs contained background foreground intensity
syn keyword gdbSetStyleArgs contained version nextgroup=gdbSetStyleVersionArgs skipwhite
syn keyword gdbSetStyleVersionArgs contained background foreground intensity

syn keyword gdbSetArgs contained tcp nextgroup=gdbSetTcpArgs skipwhite
syn match   gdbSetTcpArgs contained "\<auto-retry\>"
syn match   gdbSetTcpArgs contained "\<connect-timeout\>"

syn keyword gdbSetArgs contained tdesc nextgroup=gdbSetTdescArgs skipwhite
syn keyword gdbSetTdescArgs contained filename

syn keyword gdbSetArgs contained tui nextgroup=gdbSetTuiArgs skipwhite
syn match   gdbSetTuiArgs contained "\<active-border-mode\>"
syn match   gdbSetTuiArgs contained "\<border-kind\>"
syn match   gdbSetTuiArgs contained "\<border-mode\>"
syn match   gdbSetTuiArgs contained "\<compact-source\>"
syn match   gdbSetTuiArgs contained "\<tab-width\>"

" TODO: remote protocol specific variables?
syn keyword gdbSetArgs contained remote nextgroup=gdbSetRemoteArgs skipwhite
syn match   gdbSetRemoteArgs contained "\<TracepointSource-packet\>"
syn match   gdbSetRemoteArgs contained "\<Z-packet\>"
syn match   gdbSetRemoteArgs contained "\<access-watchpoint-packet\>"
syn match   gdbSetRemoteArgs contained "\<agent-packet\>"
syn match   gdbSetRemoteArgs contained "\<allow-packet\>"
syn match   gdbSetRemoteArgs contained "\<attach-packet\>"
syn match   gdbSetRemoteArgs contained "\<binary-download-packet\>"
syn match   gdbSetRemoteArgs contained "\<X-packet\>"
syn match   gdbSetRemoteArgs contained "\<breakpoint-commands-packet\>"
syn match   gdbSetRemoteArgs contained "\<btrace-conf-bts-size-packet\>"
syn match   gdbSetRemoteArgs contained "\<btrace-conf-pt-size-packet\>"
syn match   gdbSetRemoteArgs contained "\<catch-syscalls-packet\>"
syn match   gdbSetRemoteArgs contained "\<conditional-breakpoints-packet\>"
syn match   gdbSetRemoteArgs contained "\<conditional-tracepoints-packet\>"
syn match   gdbSetRemoteArgs contained "\<ctrl-c-packet\>"
syn match   gdbSetRemoteArgs contained "\<disable-btrace-packet\>"
syn match   gdbSetRemoteArgs contained "\<disable-randomization-packet\>"
syn match   gdbSetRemoteArgs contained "\<enable-btrace-bts-packet\>"
syn match   gdbSetRemoteArgs contained "\<enable-btrace-pt-packet\>"
syn match   gdbSetRemoteArgs contained "\<environment-hex-encoded-packet\>"
syn match   gdbSetRemoteArgs contained "\<environment-reset-packet\>"
syn match   gdbSetRemoteArgs contained "\<environment-unset-packet\>"
syn match   gdbSetRemoteArgs contained "\<exec-event-feature-packet\>"
syn match   gdbSetRemoteArgs contained "\<exec-file\>"
syn match   gdbSetRemoteArgs contained "\<fast-tracepoints-packet\>"
syn match   gdbSetRemoteArgs contained "\<fetch-register-packet\>"
syn match   gdbSetRemoteArgs contained "\<p-packet\>"
syn match   gdbSetRemoteArgs contained "\<fork-event-feature-packet\>"
syn match   gdbSetRemoteArgs contained "\<get-thread-information-block-address-packet\>"
syn match   gdbSetRemoteArgs contained "\<get-thread-local-storage-address-packet\>"
syn match   gdbSetRemoteArgs contained "\<hardware-breakpoint-limit\>"
syn match   gdbSetRemoteArgs contained "\<hardware-breakpoint-packet\>"
syn match   gdbSetRemoteArgs contained "\<hardware-watchpoint-length-limit\>"
syn match   gdbSetRemoteArgs contained "\<hardware-watchpoint-limit\>"
syn match   gdbSetRemoteArgs contained "\<hostio-close-packet\>"
syn match   gdbSetRemoteArgs contained "\<hostio-fstat-packet\>"
syn match   gdbSetRemoteArgs contained "\<hostio-open-packet\>"
syn match   gdbSetRemoteArgs contained "\<hostio-pread-packet\>"
syn match   gdbSetRemoteArgs contained "\<hostio-pwrite-packet\>"
syn match   gdbSetRemoteArgs contained "\<hostio-readlink-packet\>"
syn match   gdbSetRemoteArgs contained "\<hostio-setfs-packet\>"
syn match   gdbSetRemoteArgs contained "\<hostio-unlink-packet\>"
syn match   gdbSetRemoteArgs contained "\<hwbreak-feature-packet\>"
syn match   gdbSetRemoteArgs contained "\<install-in-trace-packet\>"
syn match   gdbSetRemoteArgs contained "\<interrupt-on-connect\>"
syn match   gdbSetRemoteArgs contained "\<interrupt-sequence\>"
syn match   gdbSetRemoteArgs contained "\<kill-packet\>"
syn match   gdbSetRemoteArgs contained "\<library-info-packet\>"
syn match   gdbSetRemoteArgs contained "\<library-info-svr4-packet\>"
syn match   gdbSetRemoteArgs contained "\<memory-map-packet\>"
syn match   gdbSetRemoteArgs contained "\<memory-read-packet-size\>"
syn match   gdbSetRemoteArgs contained "\<memory-tagging-feature-packet\>"
syn match   gdbSetRemoteArgs contained "\<memory-write-packet-size\>"
syn match   gdbSetRemoteArgs contained "\<multiprocess-feature-packet\>"
syn match   gdbSetRemoteArgs contained "\<no-resumed-stop-reply-packet\>"
syn match   gdbSetRemoteArgs contained "\<noack-packet\>"
syn match   gdbSetRemoteArgs contained "\<osdata-packet\>"
syn match   gdbSetRemoteArgs contained "\<pass-signals-packet\>"
syn match   gdbSetRemoteArgs contained "\<pid-to-exec-file-packet\>"
syn match   gdbSetRemoteArgs contained "\<program-signals-packet\>"
syn match   gdbSetRemoteArgs contained "\<query-attached-packet\>"
syn match   gdbSetRemoteArgs contained "\<read-aux-vector-packet\>"
syn match   gdbSetRemoteArgs contained "\<read-btrace-conf-packet\>"
syn match   gdbSetRemoteArgs contained "\<read-btrace-packet\>"
syn match   gdbSetRemoteArgs contained "\<read-fdpic-loadmap-packet\>"
syn match   gdbSetRemoteArgs contained "\<read-sdata-object-packet\>"
syn match   gdbSetRemoteArgs contained "\<read-siginfo-object-packet\>"
syn match   gdbSetRemoteArgs contained "\<read-watchpoint-packet\>"
syn match   gdbSetRemoteArgs contained "\<reverse-continue-packet\>"
syn match   gdbSetRemoteArgs contained "\<reverse-step-packet\>"
syn match   gdbSetRemoteArgs contained "\<run-packet\>"
syn match   gdbSetRemoteArgs contained "\<search-memory-packet\>"
syn match   gdbSetRemoteArgs contained "\<set-register-packet\>"
syn match   gdbSetRemoteArgs contained "\<P-packet\>"
syn match   gdbSetRemoteArgs contained "\<set-working-dir-packet\>"
syn match   gdbSetRemoteArgs contained "\<software-breakpoint-packet\>"
syn match   gdbSetRemoteArgs contained "\<startup-with-shell-packet\>"
syn match   gdbSetRemoteArgs contained "\<static-tracepoints-packet\>"
syn match   gdbSetRemoteArgs contained "\<supported-packets-packet\>"
syn match   gdbSetRemoteArgs contained "\<swbreak-feature-packet\>"
syn match   gdbSetRemoteArgs contained "\<symbol-lookup-packet\>"
syn match   gdbSetRemoteArgs contained "\<system-call-allowed\>"
syn match   gdbSetRemoteArgs contained "\<target-features-packet\>"
syn match   gdbSetRemoteArgs contained "\<thread-events-packet\>"
syn match   gdbSetRemoteArgs contained "\<threads-packet\>"
syn match   gdbSetRemoteArgs contained "\<trace-buffer-size-packet\>"
syn match   gdbSetRemoteArgs contained "\<trace-status-packet\>"
syn match   gdbSetRemoteArgs contained "\<traceframe-info-packet\>"
syn match   gdbSetRemoteArgs contained "\<unwind-info-block-packet\>"
syn match   gdbSetRemoteArgs contained "\<verbose-resume-packet\>"
syn match   gdbSetRemoteArgs contained "\<verbose-resume-supported-packet\>"
syn match   gdbSetRemoteArgs contained "\<vfork-event-feature-packet\>"
syn match   gdbSetRemoteArgs contained "\<write-siginfo-object-packet\>"
syn match   gdbSetRemoteArgs contained "\<write-watchpoint-packet\>"

syn match   gdbSetPrintArgs contained "\<array\>"
syn match   gdbSetPrintArgs contained "\<array-indexes\>"
syn match   gdbSetPrintArgs contained "\<asm-demangle\>"
syn match   gdbSetPrintArgs contained "\<entry-values\>"
syn match   gdbSetPrintArgs contained "\<frame-arguments\>"
syn match   gdbSetPrintArgs contained "\<frame-info\>"
syn match   gdbSetPrintArgs contained "\<inferior-events\>"
syn match   gdbSetPrintArgs contained "\<max-depth\>"
syn match   gdbSetPrintArgs contained "\<max-symbolic-offset\>"
syn match   gdbSetPrintArgs contained "\<memory-tag-violations\>"
syn match   gdbSetPrintArgs contained "\<null-stop\>"
syn match   gdbSetPrintArgs contained "\<pascal_static-members\>"
syn match   gdbSetPrintArgs contained "\<raw-frame-arguments\>"
syn match   gdbSetPrintArgs contained "\<raw-values\>"
syn match   gdbSetPrintArgs contained "\<sevenbit-strings\>"
syn match   gdbSetPrintArgs contained "\<static-members\>"
syn match   gdbSetPrintArgs contained "\<symbol\>"
syn match   gdbSetPrintArgs contained "\<symbol-filename\>"
syn match   gdbSetPrintArgs contained "\<symbol-loading\>"
syn match   gdbSetPrintArgs contained "\<thread-events\>"

syn match gdbSetArgs contained "\<auto-connect-native-target\>"

syn match gdbSetArgs contained "\<auto-load\>" nextgroup=gdbSetAutoloadArgs skipwhite
syn match gdbSetAutoloadArgs contained "\<gdb-scripts\>"
syn match gdbSetAutoloadArgs contained "\<guile-scripts\>"
syn match gdbSetAutoloadArgs contained "\<libthread-db\>"
syn match gdbSetAutoloadArgs contained "\<local-gdbinit\>"
syn match gdbSetAutoloadArgs contained "\<python-scripts\>"
syn match gdbSetAutoloadArgs contained "\<safe-path\>"
syn match gdbSetAutoloadArgs contained "\<scripts-directory\>"

syn match gdbSetArgs contained "\<auto-solib-add\>"
syn match gdbSetArgs contained "\<basenames-may-differ\>"
syn match gdbSetArgs contained "\<can-use-hw-watchpoints\>"
syn match gdbSetArgs contained "\<case-sensitive\>"
syn match gdbSetArgs contained "\<circular-trace-buffer\>"
syn match gdbSetArgs contained "\<code-cache\>"
syn match gdbSetArgs contained "\<coerce-float-to-double\>"
syn match gdbSetArgs contained "\<compile-args\>"
syn match gdbSetArgs contained "\<compile-gcc\>"
syn match gdbSetArgs contained "\<cp-abi\>"
syn match gdbSetArgs contained "\<data-directory\>"

syn match gdbSetArgs contained "\<debug\>" nextgroup=gdbSetDebugArgs skipwhite
syn keyword gdbSetDebugArgs contained arch displaced expression frame infrun jit notification observer overload parser record
syn keyword gdbSetDebugArgs contained serial skip symfile target threads timestamp varobj xml
syn match   gdbSetDebugArgs contained "\<auto-load\>"
syn match   gdbSetDebugArgs contained "\<bfd-cache\>"
syn match   gdbSetDebugArgs contained "\<check-physname\>"
syn match   gdbSetDebugArgs contained "\<coff-pe-read\>"
syn match   gdbSetDebugArgs contained "\<compile\>"
syn match   gdbSetDebugArgs contained "\<compile-cplus-scopes\>"
syn match   gdbSetDebugArgs contained "\<compile-cplus-types\>"
syn match   gdbSetDebugArgs contained "\<dwarf-die\>"
syn match   gdbSetDebugArgs contained "\<dwarf-line\>"
syn match   gdbSetDebugArgs contained "\<dwarf-read\>"
syn match   gdbSetDebugArgs contained "\<entry-values\>"
syn match   gdbSetDebugArgs contained "\<event-loop\>"
syn match   gdbSetDebugArgs contained "\<fortran-array-slicing\>"
syn match   gdbSetDebugArgs contained "\<index-cache\>"
syn match   gdbSetDebugArgs contained "\<libthread-db\>"
syn match   gdbSetDebugArgs contained "\<linux-namespaces\>"
syn match   gdbSetDebugArgs contained "\<linux-nat\>"
syn match   gdbSetDebugArgs contained "\<py-breakpoint\>"
syn match   gdbSetDebugArgs contained "\<py-micmd\>"
syn match   gdbSetDebugArgs contained "\<py-unwind\>"
syn match   gdbSetDebugArgs contained "\<remote\>"
syn match   gdbSetDebugArgs contained "\<remote-packet-max-chars\>"
syn match   gdbSetDebugArgs contained "\<separate-debug-file\>"
syn match   gdbSetDebugArgs contained "\<stap-expression\>"
syn match   gdbSetDebugArgs contained "\<symbol-lookup\>"
syn match   gdbSetDebugArgs contained "\<symtab-create\>"

syn match gdbSetArgs contained "\<debug-file-directory\>"
syn match gdbSetArgs contained "\<default-collect\>"
syn match gdbSetArgs contained "\<demangle-style\>"
syn match gdbSetArgs contained "\<detach-on-fork\>"
syn match gdbSetArgs contained "\<disable-randomization\>"
syn match gdbSetArgs contained "\<disable-randomization\>"
syn match gdbSetArgs contained "\<disassemble-next-line\>"
syn match gdbSetArgs contained "\<disassembler-options\>"
syn match gdbSetArgs contained "\<disassembly-flavor\>"
syn match gdbSetArgs contained "\<disconnected-dprintf\>"
syn match gdbSetArgs contained "\<disconnected-tracing\>"
syn match gdbSetArgs contained "\<displaced-stepping\>"
syn match gdbSetArgs contained "\<dprintf-channel\>"
syn match gdbSetArgs contained "\<dprintf-function\>"
syn match gdbSetArgs contained "\<dprintf-style\>"
syn match gdbSetArgs contained "\<dump-excluded-mappings\>"
syn match gdbSetArgs contained "\<exec-direction\>"
syn match gdbSetArgs contained "\<exec-done-display\>"
syn match gdbSetArgs contained "\<exec-file-mismatch\>"
syn match gdbSetArgs contained "\<exec-wrapper\>"
syn match gdbSetArgs contained "\<extension-language\>"
syn match gdbSetArgs contained "\<filename-display\>"
syn match gdbSetArgs contained "\<follow-exec-mode\>"
syn match gdbSetArgs contained "\<follow-fork-mode\>"
syn match gdbSetArgs contained "\<follow-fork-mode\>"
syn match gdbSetArgs contained "\<host-charset\>"

syn match   gdbSetArgs contained "\<index-cache\>" nextgroup=gdbSetIndexCacheArgs skipwhite
syn keyword gdbSetIndexCacheArgs contained directory enabled

syn match gdbSetArgs contained "\<inferior-tty\|tty\>"
syn match gdbSetArgs contained "\<input-radix\>"
syn match gdbSetArgs contained "\<interactive-mode\>"
syn match gdbSetArgs contained "\<libthread-db-search-path\>"
syn match gdbSetArgs contained "\<max-completions\>"
syn match gdbSetArgs contained "\<max-user-call-depth\>"
syn match gdbSetArgs contained "\<max-value-size\>"
syn match gdbSetArgs contained "\<may-call-functions\>"
syn match gdbSetArgs contained "\<may-insert-breakpoints\>"
syn match gdbSetArgs contained "\<may-insert-fast-tracepoints\>"
syn match gdbSetArgs contained "\<may-insert-tracepoints\>"
syn match gdbSetArgs contained "\<may-interrupt\>"
syn match gdbSetArgs contained "\<may-write-memory\>"
syn match gdbSetArgs contained "\<may-write-registers\>"
syn match gdbSetArgs contained "\<mi-async\>"
syn match gdbSetArgs contained "\<multiple-symbols\>"
syn match gdbSetArgs contained "\<non-stop\>"
syn match gdbSetArgs contained "\<opaque-type-resolution\>"
syn match gdbSetArgs contained "\<output-radix\>"
syn match gdbSetArgs contained "\<overload-resolution\>"
syn match gdbSetArgs contained "\<range-stepping\>"
syn match gdbSetArgs contained "\<schedule-multiple\>"
syn match gdbSetArgs contained "\<scheduler-locking\>"
syn match gdbSetArgs contained "\<script-extension\>"
syn match gdbSetArgs contained "\<solib-absolute-prefix\>"
syn match gdbSetArgs contained "\<solib-search-path\>"
syn match gdbSetArgs contained "\<stack-cache\>"
syn match gdbSetArgs contained "\<startup-quietly\>"
syn match gdbSetArgs contained "\<startup-with-shell\>"
syn match gdbSetArgs contained "\<step-mode\>"
syn match gdbSetArgs contained "\<stop-on-solib-events\>"
syn match gdbSetArgs contained "\<struct-convention\>"
syn match gdbSetArgs contained "\<substitute-path\>"
syn match gdbSetArgs contained "\<suppress-cli-notifications\>"
syn match gdbSetArgs contained "\<target-charset\>"
syn match gdbSetArgs contained "\<target-file-system-kind\>"
syn match gdbSetArgs contained "\<target-wide-charset\>"
syn match gdbSetArgs contained "\<trace-buffer-size\>"
syn match gdbSetArgs contained "\<trace-commands\>"
syn match gdbSetArgs contained "\<trace-notes\>"
syn match gdbSetArgs contained "\<trace-stop-notes\>"
syn match gdbSetArgs contained "\<trace-user\>"
syn match gdbSetArgs contained "\<trust-readonly-sections\>"
syn match gdbSetArgs contained "\<unwindonsignal\>"
syn match gdbSetArgs contained "\<unwind-on-terminating-exception\>"
syn match gdbSetArgs contained "\<use-coredump-filter\>"
syn match gdbSetArgs contained "\<use-deprecated-index-sections\>"
" removed
" syn match gdbSetArgs contained "\<symbol-reloading\>"

syn keyword gdbSkipArgs contained delete disable enable file function

syn keyword gdbTuiArgs contained disable enable reg
syn match   gdbTuiArgs contained "\<new-layout\>"

syn keyword gdbUnsetArgs contained environment exec-wrapper substitute-path tdesc
syn match   gdbUnsetArgs contained "\<exec-wrapper\>"
syn match   gdbUnsetArgs contained "\<substitute-path\>"

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

hi def link gdbCommandArgs			Type
hi def link gdbCatchArgs			gdbCommandArgs
hi def link gdbDeleteArgs			gdbCommandArgs
hi def link gdbDisableArgs			gdbCommandArgs
hi def link gdbEnableArgs			gdbCommandArgs
hi def link gdbEnableBreakpointArgs		gdbEnabledArgs
hi def link gdbInfoArgs				gdbCommandArgs
hi def link gdbLayoutArgs			gdbCommandArgs
hi def link gdbOverlayArgs			gdbCommandArgs
hi def link gdbSaveArgs				gdbCommandArgs
hi def link gdbSkipArgs				gdbCommandArgs
hi def link gdbSetArgs				gdbCommandArgs
hi def link gdbSetAdaArgs			gdbCommandArgs
hi def link gdbSetAutoloadArgs			gdbCommandArgs
hi def link gdbSetBacktraceArgs			gdbCommandArgs
hi def link gdbSetBreakpointArgs		gdbCommandArgs
hi def link gdbSetCheckArgs			gdbCommandArgs
hi def link gdbSetDcacheArgs			gdbCommandArgs
hi def link gdbSetDebugArgs			gdbCommandArgs
hi def link gdbSetDebuginfodArgs		gdbCommandArgs
hi def link gdbSetFortranArgs			gdbCommandArgs
hi def link gdbSetGuileArgs			gdbCommandArgs
hi def link gdbSetHistoryArgs			gdbCommandArgs
hi def link gdbSetIndexCacheArgs		gdbCommandArgs
hi def link gdbSetLoggingArgs			gdbCommandArgs
hi def link gdbSetMemArgs			gdbCommandArgs
hi def link gdbSetMpxArgs			gdbCommandArgs
hi def link gdbSetPrintArgs			gdbCommandArgs
hi def link gdbSetPrintTypeArgs			gdbSetPrintArgs
hi def link gdbSetPythonArgs			gdbCommandArgs
hi def link gdbSetRavenscarArgs			gdbCommandArgs
hi def link gdbSetRecordArgs			gdbCommandArgs
hi def link gdbSetRecordBtraceArgs		gdbSetRecordArgs
hi def link gdbSetRecordBtraceBtsArgs		gdbSetRecordBtraceArgs
hi def link gdbSetRecordBtraceCpuArgs		gdbSetRecordBtraceArgs
hi def link gdbSetRecordFullArgs		gdbSetRecordArgs
hi def link gdbSetRecordBtracePtArgs		gdbSetRecordBtraceArgs
hi def link gdbSetRemoteArgs			gdbCommandArgs
hi def link gdbSetSerialArgs			gdbCommandArgs
hi def link gdbSetSourceArgs			gdbCommandArgs
hi def link gdbSetStyleArgs			gdbCommandArgs
hi def link gdbSetStyleAddressArgs		gdbSetStyleArgs
hi def link gdbSetStyleDissassemblerArgs	gdbSetStyleArgs
hi def link gdbSetStyleFilenameArgs		gdbSetStyleArgs
hi def link gdbSetStyleFunctionArgs		gdbSetStyleArgs
hi def link gdbSetStyleHighlightArgs		gdbSetStyleArgs
hi def link gdbSetStyleMetadataArgs		gdbSetStyleArgs
hi def link gdbSetStyleTitleArgs		gdbSetStyleArgs
hi def link gdbSetStyleTuiActiveBorderArgs	gdbSetStyleArgs
hi def link gdbSetStyleTuiBorderArgs		gdbSetStyleArgs
hi def link gdbSetStyleVariableArgs		gdbSetStyleArgs
hi def link gdbSetStyleVersionArgs		gdbSetStyleArgs
hi def link gdbSetTuiArgs			gdbCommandArgs
hi def link gdbSetTcpArgs			gdbCommandArgs
hi def link gdbSetTdescArgs			gdbCommandArgs
hi def link gdbTuiArgs				gdbCommandArgs
hi def link gdbUnsetArgs			gdbCommandArgs

hi def link gdbDocument		Special
hi def link gdbNumber		Number
hi def link gdbLineContinuation	Special

let b:current_syntax = "gdb"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
