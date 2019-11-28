function __init_rbenv -d 'Initialize rbenv'
    if not type rbenv >/dev/null ^/dev/null
        if [ $argv[1] ]
            if [ $argv[1] = '-v' ]; or [ $argv[1] = '--verbose' ]
                set -l filename (basename (status -f))
                echo $filename: (set_color yellow)rbenv executable is not found.(set_color normal) 1>&2
            end
        end

        return 0
    end

    set -l rbenv_path "$HOME/.rbenv"

    for path in "$rbenv_path/bin" "$rbenv_path/shims"
        if not contains "$path" $fish_user_paths
            if test -d "$path"
                set -U fish_user_paths "$path" $fish_user_paths
            end
        end
    end

    rbenv rehash >/dev/null ^/dev/null
end
