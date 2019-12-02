function __init_node -d 'Initialize Node'
    if not type nvm >/dev/null ^/dev/null
        if isatty
            set -l filename (basename (status -f))
            echo $filename: (set_color yellow)nvm is not found.(set_color normal) 1>&2

            return 0
        end
    end

    if isatty
        if test -f .nvmrc
            nvm
        else
            nvm use lts
        end
    end
end
