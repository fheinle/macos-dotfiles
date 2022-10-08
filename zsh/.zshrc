for config_file in ~/.config/zsh/*;
do
    [ -r "${config_file}" ] && source "${config_file}"
done
