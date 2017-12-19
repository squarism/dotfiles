# Defined in - @ line 0
function brewski --description 'alias brewski brew update; and brew upgrade; and brew cleanup; and brew doctor'
	brew update; and brew upgrade; and brew cleanup; and brew doctor $argv;
end
