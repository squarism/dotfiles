# Defined in - @ line 0
function gpr --description 'alias gpr=git pull --rebase --prune'
	git pull --rebase --prune $argv;
end
