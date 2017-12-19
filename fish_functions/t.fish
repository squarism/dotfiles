# Defined in - @ line 0
function t --description 'alias t exa -l -T -L 2 --header --git-ignore -I node_modules -I vendor -F -d -B --color-scale'
	exa -l -T -L 2 --header --git-ignore -I node_modules -I vendor -F -d -B --color-scale $argv;
end
