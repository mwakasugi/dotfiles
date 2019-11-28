function __init_yarn -d 'Initialize yarn environment'
    if not type yarn >/dev/null ^/dev/null
        if [ $argv[1] ]
            if [ $argv[1] = '-v' ]; or [ $argv[1] = '--verbose' ]
                set -l filename (basename (status -f))
                echo $filename: (set_color yellow)yarn executable is not found.(set_color normal) 1>&2
            end
        end

        return 0
    end

    set -l yarn_bin_path (yarn global bin)

    if not contains "$yarn_bin_path" $fish_user_paths
        set -U fish_user_paths "$yarn_bin_path" $fish_user_paths
    end
end
