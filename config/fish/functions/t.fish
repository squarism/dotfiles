function t --description 'eza-based tree'
    set -l path (test (count $argv) -ge 1; and echo $argv[1]; or echo .)
    set -l depth (test (count $argv) -ge 2; and echo $argv[2]; or echo 2)
    eza -l -T --header --git-ignore -F -I node_modules -L $depth $path
end
