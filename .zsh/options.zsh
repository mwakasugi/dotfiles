# ==============================================================================
# Changing Directories
# ==============================================================================
# AUTO_CD: Change directory if the command doesn't exist.
setopt autocd

# AUTO_PUSHD: Make cd push the old directory onto the directory stack.
setopt autopushd

# CDABLE_VARS: Try to expand the expression as if it were preceded by a `~'.
# setopt cdablevars

# CHASE_DOTS: If containing a path segment '..', resolve the path to the physical directory.
# setopt chasedots

# CHASE_LINKS: Change directory to a symlink is in fact cd to the true directory.
# setopt chaselinks

# POSIX_CD: Make directory changing more POSIX-compatible.
# setopt posixcd

# PUSHD_IGNORE_DUPS: Don't push multiple copies of the same directory onto the directory stack.
# setopt pushdignoredups

# PUSHD_MINUS: Exchanges the meanings of '+' and '-' when used with a number to specify a directory in the stack.
# setopt pushdminus

# PUSHD_SILENT: Don't print the directory stack after pushd or popd.
# setopt pushdsilent

# PUSHD_TO_HOME: Have pushd with no arguments act like 'pushd $HOME'.
# setopt pushdtohome

# ==============================================================================
# Completion
# ==============================================================================
# ALWAYS_LAST_PROMPT: Try to return to the last prompt if given no numeric argument.
# unsetopt alwayslastprompt

# ALWAYS_TO_END: Move to end of word when completing.
setopt alwaystoend

# AUTO_LIST: Automatically list choices on an ambiguous completion.
# unsetopt autolist

# AUTO_MENU: Automatically use menu completion.
# unsetopt automenu

# AUTO_NAME_DIRS: Use named dirs when possible.
# setopt autonamedirs

# AUTO_PARAM_KEYS: Complete parenthesis and a parameter name automatically.
# unsetopt autoparamkeys

# AUTO_PARAM_SLASH: If a parameter is completed whose content is the name of a directory, then add a trailing slash instead of a space.
# unsetopt autoparamslash

# AUTO_REMOVE_SLASH: Remove slash on dirs if word separator added.
# unsetopt autoremoveslash

# BASH_AUTO_LIST: On an ambiguous completion, automatically list choices when the completion function is called twice in succession.
# setopt bashautolist

# COMPLETE_ALIASES: Don't replace alias before completion.
# setopt completealiases

# COMPLETE_IN_WORD: The cursor is not set to the end of the word if completion is started.
# setopt completeinword

# GLOB_COMPLETE: Don't show completions when using '*'.
# setopt globcomplete

# HASH_LIST_ALL: Make sure the entire command path is hashed first.
# unsetopt hashlistall

# LIST_AMBIGUOUS: Unambiguous prefix completion is done silently.
# unsetopt listambiguous

# LIST_BEEP: Don't beep on an ambiguous completion.
# unsetopt listbeep

# LIST_PACKED: Try to make the completion list smaller (occupying less lines) by printing the matches in columns with different widths.
setopt listpacked

# LIST_ROWS_FIRST: Move horizontally during completion.
# setopt listrowsfirst

# LIST_TYPES: Show types of listing files.
# unsetopt listtypes

# MENU_COMPLETE: Don't autoselect the first completion entry.
# setopt menucomplete

# REC_EXACT: In completion, recognize exact matches even if they are ambiguous.
# setopt recexact

# ==============================================================================
# Expansion and Globbing
# ==============================================================================
# BAD_PATTERN: If a pattern for filename generation is badly formed, print an error message.
# unsetopt badpattern

# BARE_GLOB_QUAL: In a glob pattern, treat a trailing set of parentheses as a qualifier list, if it contains no '|','(' or (if special) '~' characters.
# unsetopt bareglobqual

# BRACE_CCL: Enable expansion from {a-c} to a b c.
setopt braceccl

# CASE_GLOB: Use case-insensitive matching.
# unsetopt caseglob

# CASE_MATCH: Make regular expressions using the zsh/regex module.
# unsetopt casematch

# CSH_NULL_GLOB: Use csh-like glob.
# setopt cshnullglob

# EQUALS: Expand = command to the path of the command.
# unsetopt equals

# EXTENDED_GLOB: Treat the '#', '~' and '^' characters as part of patterns for filename generation, etc.
setopt extendedglob

# FORCE_FLOAT: Constants in arithmetic evaluation will be treated as floating point.
# setopt forcefloat

# GLOB: Perform filename generation (globbing).
# unsetopt glob

# GLOB_ASSIGN: Globbing on the right hand side.
# setopt globassign

# GLOB_DOTS: Don't require a leading '.' in a filename to be matched explicitly.
# setopt globdots

# When this option is set and the default zsh-style globbing is in effect, the pattern ‘**/*’ can be abbreviated to ‘**’ and the pattern ‘***/*’ can be abbreviated to ***.
# setopt globstarshort

# GLOB_SUBST: Use recursive glob expansion. (variable expansion)
# setopt globsubst

# HIST_SUBST_PATTERN: Substitutions using the :s and :& history modifiers are performed with pattern matching instead of string matching.
# setopt histsubstpattern

# IGNORE_BRACES: Enable brace expansion.
# setopt ignorebraces

# IGNORE_CLOSE_BRACES: In command typing, don't need close brace '}'.
# setopt ignoreclosebraces

# KSH_GLOB: ksh-like globbing.
# setopt kshglob

# MAGIC_EQUAL_SUBST: Enable completion after = like --prefix=/usr...
# setopt magicequalsubst

# MARK_DIRS: Append a trailing '/' to all directory names resulting from filename generation (globbing)
# setopt markdirs

# MULTIBYTE: Enable multibyte characters.
# unsetopt multibyte

# NOMATCH: If a pattern for filename generation has no matches, print an error.
# unsetopt nomatch

# NULL_GLOB: If a pattern for filename generation has no matches, delete the pattern from the argument list instead of reporting an error.
# setopt nullglob

# NUMERIC_GLOB_SORT: Use numeric sort instead of alphabetic sort.
# setopt numericglobsort

# RC_EXPAND_PARAM: Enable array expansions.
# setopt rcexpandparam

# REMATCH_PCRE: The '=~' operator will use Perl-Compatible Regular Expressions.
# setopt rematchpcre

# SH_GLOB: Disables the special meaning of '(', '|', ')' and '<' for globbing.
# setopt shglob

# UNSET: Treat unset parameters as if they were empty when substituting.
# unsetopt unset

# WARN_CREATE_GLOBAL: Print a warning message when a global parameter is created in a function by an assignment.
# setopt warncreateglobal

# ==============================================================================
# History
# ==============================================================================
# APPEND_HISTORY: Append rather than overwrite history file.
# unsetopt appendhistory

# BANG_HIST: Perform textual history expansion, csh-style, treating the character '!' specially
# unsetopt banghist

# EXTENDED_HISTORY: Save additional info to $HISTFILE.
# setopt extendedhistory

# HIST_ALLOW_CLOBBER: Add '|' to output redirections in the history.
# setopt histallowclobber

# HIST_BEEP: Don't beep at no history.
# unsetopt histbeep

# HIST_EXPIRE_DUPS_FIRST: The oldest history event that has a duplicate to be lost before losing a unique event from the list.
# setopt histexpiredupsfirst

# HIST_FCNTL_LOCK: Locking history file fcntl call. (better performance)
# setopt histfcntllock

# HIST_FIND_NO_DUPS: When searching for history entries in the line editor, do not display duplicates of a line previously found.
# setopt histfindnodups

# HIST_IGNORE_ALL_DUPS: If a new command line being added to the history list duplicates an older one, the older command is removed from the list.
setopt histignorealldups

# HIST_IGNORE_DUPS: Ignore duplicate command history list.
setopt histignoredups

# HIST_IGNORE_SPACE: If the commandline starts with a whitespace, don't add it to history.
# setopt histignorespace

# HIST_LEX_WORDS: Words read in from a history file are divided up in a similar fashion to normal shell command line handling.
# setopt histlexwords

# HIST_NO_FUNCTIONS: Don't store function definitions in the history list.
# setopt histnofunctions

# HIST_NO_STORE: Remove the history (fc -l) command from the history list when invoked.
# setopt histnostore

# HIST_REDUCE_BLANKS: Remove superfluous blanks from each command line being added to the history list.
setopt histreduceblanks

# HIST_SAVE_BY_COPY: Don't create temporaly file to copy history.
# unsetopt histsavebycopy

# HIST_SAVE_NO_DUPS: Avoid duplicates on history saving.
setopt histsavenodups

# HIST_VERIFY: Don't execute the line directly from the history.
# setopt histverify

# INC_APPEND_HISTORY: New history lines are added to the $HISTFILE incrementally.
setopt incappendhistory

# INC_APPEND_HISTORY_TIME: The time taken by the command is recorded correctly in the history file in EXTENDED_HISTORY format.
# setopt incappendhistorytime

# SHARE_HISTORY: Share history file among all zsh sessions.
setopt sharehistory

# ==============================================================================
# Initialisation
# ==============================================================================
# ALL_EXPORT: Export all valiables automatically.
# setopt allexport

# GLOBAL_EXPORT: Local variables are not globale ones.
# unsetopt globalexport

# GLOBAL_RCS: Ignore startup files in /etc (except /etc/zshenv) .
# unsetopt globalrcs

# RCS: Ignore startup files in anywhere (except /etc/zshenv) .
# unsetopt rcs

# ==============================================================================
# Input/Output
# ==============================================================================
# ALIASES: Expand aliases.
# unsetopt aliases

# CLOBBER: Allows '>' redirection to truncate existing files, and '>>' to create files. Otherwise '>!' or '>|' must be used to truncate a file, and '>>!' or '>>|' to create a file.
# unsetopt clobber

# CORRECT: Try to correct the spelling of commands.
# setopt correct

# CORRECT_ALL: Try to correct the spelling of all arguments in a line.
# setopt correctall

# DVORAK: Use Dvorak mapping during error correction.
# setopt dvorak

# FLOW_CONTROL: No follow control by ^S and ^Q.
# unsetopt flowcontrol

# IGNORE_EOF: Disable ^D to exit shell.
# setopt ignoreeof

# INTERACTIVE_COMMENTS: Allow comments even in interactive shells.
# setopt interactivecomments

# HASH_CMDS: Subsequent invocations of the same command will use the saved location, avoiding a path search.
# unsetopt hashcmds

# HASH_DIRS: Whenever a command name is hashed, hash the directory containing it, as well as all directories that occur earlier in the path.
# unsetopt hashdirs

# HASH_EXECUTABLES_ONLY: Check that the file to be hashed is actually an executable.
# setopt hashexecutablesonly

# MAIL_WARNING: Print a warning message if a mail file has been accessed since the shell last checked.
# setopt mailwarning

# PATH_DIRS: Perform a path search even on command names with slashes in them.
# setopt pathdirs

# PATH_SCRIPT: The script does not specify a directory path, the script is looked for first in the current directory.
# setopt pathscript

# PRINT_EIGHTBIT: Enable file names using 8 bits, important to rendering Japanese file names.
setopt printeightbit

# PRINT_EXIT_VALUE: Print the exit value of programs with non-zero exit status.
# setopt printexitvalue

# RC_QUOTES: Allow the character sequence "''" to signify a single quote within singly quoted str.
# setopt rcquotes

# RM_STAR_SILENT: Do not query the user before executing 'rm *' or 'rm path/*'.
# setopt rmstarsilent

# RM_STAR_WAIT: If querying the user before executing 'rm *' or 'rm path/*', first wait ten seconds and ignore anything typed in that time.
# setopt rmstarwait

# SHORT_LOOPS: Allow the short forms of for, repeat, select, if, and function constructs.
# unsetopt shortloops

# SUN_KEYBORD_HACK: If a line ends with a backquote, and there are an odd number of backquotes on the line, ignore the trailing backquote.
# setopt sunkeyboardhack

# ==============================================================================
# Job Control
# ==============================================================================
# Stopped jobs that are removed from the job table with the disown builtin command are automatically sent a CONT signal.
# setopt autocontinue

# Resume the command if the command is suspended.
# setopt autoresume

# Run all background jobs at a lower priority.
# unsetopt bgnice

# Report the status of background and suspended jobs before exiting a shell.
# unsetopt checkjobs

# Send the HUP signal to running jobs when the shell exits.
# unsetopt hup

# List jobs in the long format by default.
# setopt longlistjobs

# Allow job control.
# setopt monitor

# Report the status of background jobs immediately.
# unsetopt notify

# Make job control more POSIX compliant.
# setopt posixjobs

# ==============================================================================
# Prompting
# ==============================================================================
# '!' is treated specially in prompt expansion.
# setopt promptbang

# Don't print a carriage return just before printing a prompt in the line editor.
# unsetopt promptcr

# The shell parameter PROMPTEOLMARK can be used to customize how the end of partial lines are shown.
# unsetopt promptsp

# '%' is treated specially in prompt expansion.
# unsetopt promptpercent

# Expand parameters in the prompt.
# unsetopt promptsubst

# Remove any right prompt from display when accepting a command line.
# setopt transientrprompt

# ==============================================================================
# Scripts and Functions
# * Basically you MUST NOT modify this options
# ==============================================================================
# setopt cbases
# setopt cprecedences
# setopt debugbeforecmd
# setopt errexit
# setopt errreturn
# unsetopt evallineno
# unsetopt exec
# unsetopt functionargzero
# setopt localloops
# setopt localoptions
# setopt localpatterns
# setopt localtraps
# unsetopt multifuncdef
# unsetopt multios
# setopt octalzeroes
# setopt pipefail
# setopt sourcetrace
# setopt typesetsilent
# setopt verbose
# setopt xtrace

# ==============================================================================
# Shell Emulation
# * Basically you MUST NOT modify this options
# ==============================================================================
# setopt appendcreate
# setopt bashrematch
# setopt bsdecho
# setopt continueonerror
# setopt cshjunkiehistory
# setopt cshjunkieloops
# setopt cshjunkiequotes
# setopt cshnullcmd
# setopt ksharrays
# setopt kshautoload
# setopt kshoptionprint
# setopt kshtypeset
# setopt kshzerosubscript
# setopt posixaliases
# setopt posixargzero
# setopt posixbuiltins
# setopt posixidentifiers
# setopt posixstrings
# setopt posixtraps
# setopt shfileexpansion
# setopt shnullcmd
# setopt shoptionletters
# setopt shwordsplit
# setopt trapsasync

# ==============================================================================
# Shell State
# * Basically you MUST NOT modify this options
# ==============================================================================
# setopt interactive
# setopt login
# setopt privileged
# setopt restricted
# setopt shinstdin
# setopt singlecommand

#-----------------------------------
# Zle
#-----------------------------------
# Beep on error in ZLE
# unsetopt beep

# Assume that the terminal displays combining characters correctly.
# setopt combiningchars

# If ZLE is loaded, turning on this option has the equivalent effect of ‘bindkey -e’.
# setopt emacs

# Start up the line editor in overstrike mode.
# setopt overstrike

# Use single-line command line editing instead of multi-line.
# setopt singlelinezle

# If ZLE is loaded, turning on this option has the equivalent effect of ‘bindkey -v’.
# setopt vi

# Use the zsh line editor. Set by default in interactive shells connected to a terminal.
# setopt zle
