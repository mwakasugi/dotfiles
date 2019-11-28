function __init_go -d 'Initialize Go environment along with setting GOPATH'
    if not type go >/dev/null ^/dev/null
        if [ $argv[1] ]
            if [ $argv[1] = '-v' ]; or [ $argv[1] = '--verbose' ]
                set -l filename (basename (status -f))
                echo $filename: (set_color yellow)go executable is not found.(set_color normal) 1>&2
            end
        end
        return 0
    end

    if not set -q GOPATH
        set -l default_location "$HOME/go"
        if [ $argv[1] ]
            if [ $argv[1] = '-v' ]; or [ $argv[1] = '--verbose' ]
                echo $filename: (set_color yellow)GOPATH is not set.(set_color normal)
                echo $filename: (set_color green)Setting GOPATH to the default location [$default_location](set_color normal)
            end
        end
        set -gx GOPATH $default_location
    end

    if not test -d "$GOPATH"
        if [ $argv[1] ]
            if [ $argv[1] = '-v' ]; or [ $argv[1] = '--verbose' ]
                echo $filename: (set_color green)Creating the GOPATH directory [$default_location](set_color normal)
            end
        end
        mkdir "$GOPATH"
    end

    for path in "$GOPATH" "$GOPATH/bin"
        if not contains "$path" $fish_user_paths
            set -U fish_user_paths "$path" $fish_user_paths
        end
    end
end