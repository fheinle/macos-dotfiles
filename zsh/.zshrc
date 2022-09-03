for config_file in /Users/florian/.config/zsh/*;
do
    [ -r "${config_file}" ] && source "${config_file}"
done
