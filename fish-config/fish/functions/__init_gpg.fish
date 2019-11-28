function __init_gpg -d 'Launch GPG Agent or connect to it'
    if not type gpg-connect-agent >/dev/null ^/dev/null
        if [ $argv[1] ]
            if [ $argv[1] = '-v' ]; or [ $argv[1] = '--verbose' ]
                set -l filename (basename (status -f))
                echo $filename: (set_color yellow)gpg-connect-agent is not found.(set_color normal) 1>&2
            end
        end

        return 0
    end

    set -x GPG_TTY (tty)
    export GPG_AGENT_INFO="$HOME/.gnupg/S.gpg-agent:0:1"

    if [ ! (pgrep -x -u $USER "gpg-agent" | head -1) ]
        set -el DISPLAY
        echo "Invoking gpg-agent"
        gpg-connect-agent /bye
    end
end
