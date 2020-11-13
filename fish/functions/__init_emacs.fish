function __init_emacs -d 'Get ready to use Emacs'
    set -gx EDITOR "emacsclient --alternate-editor '' -nw"
    alias e $EDITOR
end
