function __init_direnv -d 'Initialize direnv'
    if not type direnv >/dev/null ^/dev/null
        if [ $argv[1] ]
            if [ $argv[1] = '-v' ]; or [ $argv[1] = '--verbose' ]
                set -l filename (basename (status -f))
                echo $filename: (set_color yellow)direnv executable is not found.(set_color normal) 1>&2
            end
        end

        return 0
    end

    eval (direnv hook fish)

    # wrap tmux to avoid issues with environment loading
    if type tmux >/dev/null ^/dev/null
        alias tmux 'direnv exec / tmux'
    end
end
