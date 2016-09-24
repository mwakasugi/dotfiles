# ==============================================================================
# Changing Directories
# ==============================================================================
# setopt autocd               # AUTO_CD
# setopt autopushd            # AUTO_PUSHD
# setopt cdablevars           # CDABLE_VARS
# setopt chasedots            # CHASE_DOTS
# setopt chaselinks           # CHASE_LINKS
# setopt posixcd              # POSIX_CD
# setopt pushdignoredups      # PUSHD_IGNORE_DUPS
# setopt pushdminus           # PUSHD_MINUS
# setopt pushdsilent          # PUSHD_SILENT
# setopt pushdtohome          # PUSHD_TO_HOME

# ==============================================================================
# Completion
# ==============================================================================
# unsetopt alwayslastprompt   # ALWAYS_LAST_PROMPT
# setopt alwaystoend          # ALWAYS_TO_END
# unsetopt autolist           # AUTO_LIST
# unsetopt automenu           # AUTO_MENU
# setopt autonamedirs         # AUTO_NAME_DIRS
# unsetopt autoparamkeys      # AUTO_PARAM_KEYS
# unsetopt autoparamslash     # AUTO_PARAM_SLASH
# unsetopt autoremoveslash    # AUTO_REMOVE_SLASH
# setopt bashautolist         # BASH_AUTO_LIST
# setopt completealiases      # COMPLETE_ALIASES
# setopt completeinword       # COMPLETE_IN_WORD
# setopt globcomplete         # GLOB_COMPLETE
# unsetopt hashlistall        # HASH_LIST_ALL
# unsetopt listambiguous      # LIST_AMBIGUOUS
# unsetopt listbeep           # LIST_BEEP
# setopt listpacked           # LIST_PACKED
# setopt listrowsfirst        # LIST_ROWS_FIRST
# unsetopt listtypes          # LIST_TYPES
# setopt menucomplete         # MENU_COMPLETE
# setopt recexact             # REC_EXACT

# ==============================================================================
# Expansion and Globbing
# ==============================================================================
# unsetopt badpattern         # BAD_PATTERN
# unsetopt bareglobqual       # BARE_GLOB_QUAL
# setopt braceccl             # BRACE_CCL
# unsetopt caseglob           # CASE_GLOB
# unsetopt casematch          # CASE_MATCH
# setopt cshnullglob          # CSH_NULL_GLOB
# unsetopt equals             # EQUALS
# setopt extendedglob         # EXTENDED_GLOB
# setopt forcefloat           # FORCE_FLOAT
# unsetopt glob               # GLOB
# setopt globassign           # GLOB_ASSIGN
# setopt globdots             # GLOB_DOTS
# setopt globsubst            # GLOB_SUBST
# setopt histsubstpattern     # HIST_SUBST_PATTERN
# setopt ignorebraces         # IGNORE_BRACES
# setopt ignoreclosebraces    # IGNORE_CLOSE_BRACES
# setopt kshglob              # KSH_GLOB
# setopt magicequalsubst      # MAGIC_EQUAL_SUBST
# setopt markdirs             # MARK_DIRS
# unsetopt multibyte          # MULTIBYTE
# unsetopt nomatch            # NOMATCH
# setopt nullglob             # NULL_GLOB
# setopt numericglobsort      # NUMERIC_GLOB_SORT
# setopt rcexpandparam        # RC_EXPAND_PARAM
# setopt rematchpcre          # REMATCH_PCRE
# setopt shglob               # SH_GLOB
# unsetopt unset              # UNSET
# setopt warncreateglobal     # WARN_CREATE_GLOBAL

# ==============================================================================
# History
# ==============================================================================
# unsetopt appendhistory # APPEND_HISTORY
# unsetopt banghist # BANG_HIST
# setopt extendedhistory # EXTENDED_HISTORY
# setopt histallowclobber # HIST_ALLOW_CLOBBER
# unsetopt histbeep # HIST_BEEP
# setopt histexpiredupsfirst # HIST_EXPIRE_DUPS_FIRST
# setopt histfcntllock #HIST_FCNTL_LOCK
# setopt histfindnodups # HIST_FIND_NO_DUPS
# setopt histignorealldups # HIST_IGNORE_ALL_DUPS
# 直前のコマンドと同じコマンドはヒストリに保存しない
# set -o HIST_IGNORE_DUPS
# 行頭がスペースのコマンドはヒストリに保存しない
# set -o HIST_IGNORE_SPACE
# ヒストリファイルの形式を変更する
#set -o HIST_LEX_WORDS
# ヒストリから関数定義を除去する
# set -o HIST_NO_FUNCTIONS
# ヒストリコマンドをヒストリから取り除く
# set -o HIST_NO_STORE
# ヒストリ保存時に余分な空白を除去する
# set -o HIST_REDUCE_BLANKS
# ヒストリを一旦コピーファイルに保存しない
#set +o HIST_SAVE_BY_COPY
# ヒストリファイルに書き出すときに以前のコマンドと同じものを除去する
# set -o HIST_SAVE_NO_DUPS
# ヒストリコマンドを直接実行しない
#set -o HIST_VERIFY
# ヒストリをヒストリファイルに即座に書き込む
# set -o INC_APPEND_HISTORY
# ヒストリ書き込み時間をヒストリファイルに追加する
#set -o INC_APPEND_HISTORY_TIME
# ヒストリの読み出しと書き込みを同時に行う
# set -o SHARE_HISTORY







