function __init_node -d 'Initialize Node'
    if not type nvm >/dev/null ^/dev/null
        if [ $argv[1] ]
            if [ $argv[1] = '-v' ]; or [ $argv[1] = '--verbose' ]
                set -l filename (basename (status -f))
                echo $filename: (set_color yellow)nvm is not found.(set_color normal) 1>&2
            end
        end

        return 0
    end

    if test -f .nvmrc
        nvm
    else
        nvm use lts
    end
end
