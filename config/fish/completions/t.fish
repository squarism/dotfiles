complete -c t -f
complete -c t -n '__fish_is_first_arg' -a '(__fish_complete_directories)'
complete -c t -n 'test (count (commandline -opc)) -eq 2' -a '1 2 3 4 5' -d depth
