set -g fish_prompt_pwd_dir_length 3

# While this is not efficient way to set paths in Fish,
# clear fish_user_paths at first for simplification
set -U fish_user_paths

begin
    set -l source_dirs aliases
    set -l fish_config_dir "$HOME/.config/fish"

    pushd $fish_config_dir

    for dir in $source_dirs
        if test -d $dir; and not test (git check-ignore $dir)
            for src in (ls $dir)
                if not test (git check-ignore $dir/$src)
                    source $dir/$src
                end
            end
        end
    end

    popd
end

# Add paths
begin
    set -l paths_to_add \
        "/usr/local/bin" \
        "/usr/local/sbin" \
        "$HOME/.local/bin" \
        "/usr/local/go/bin" \
        "$HOME/.cargo/bin" \
        "$HOME/.composer/vendor/bin" \
        "$HOME/.fzf/bin" \
        "$HOME/.emacs.d/bin" \
        "$HOME/.deno/bin"

    for path in $paths_to_add
        if test -d "$path"; and not contains "$path" $fish_user_paths
            set -U fish_user_paths "$path" $fish_user_paths
        end
    end
end

# Initalize environent settings
__init_direnv
__init_emacs
__init_go
__init_gpg
__init_node
__init_java

# Source local specific config
begin
    set -l fish_local_config "$HOME/.config/fish/config.local.fish"
    if test -f $fish_local_config
        source $fish_local_config
    end
end
