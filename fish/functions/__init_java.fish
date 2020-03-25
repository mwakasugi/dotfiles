function __init_java -d 'Initialize Java'
    if not type /usr/libexec/java_home >/dev/null ^/dev/null
        if isatty
            set -l filename (basename (status -f))
            echo $filename: (set_color yellow)Java is not installed.(set_color normal) 1>&2
        end

        return 0
    end

    set -l java_home (/usr/libexec/java_home)

    if not contains "$java_home/bin" $fish_user_paths
        set -U fish_user_paths "$java_home/bin" $fish_user_paths
    end

    set -gx JAVA_HOME $java_home
end
