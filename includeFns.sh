function greetings {
printf """Greetings, $USER! 

This script will set up key elements of DC's work environment. The following packages will be installed and configured: ${bld}emacs, git, tmux, bash${nrm}.

For successful execution, the script may require at various points: ${bld}apt-get, sudo${nrm}.\n"""
}


function askConsent {
    printf "Set up the environment? (Y/n) "
    read generalConsent # uncomment this line to use the script
    #generalConsent="y"  # dev purposes, comment out to use the script.
    generalConsent=${generalConsent^^}

    if [ "$generalConsent" = "Y" ]
    then

	printf "Blanket consent to configuring and personalizing git, emacs, tmux, and bash? (Y/n) "
	read blanketConsent # uncomment this line to use the script
	blanketConsent=${blanketConsent^^}
	if [ "$blanketConsent" = "Y" ]
	then
	    printf "Are you sure? (Y/n) "
	    read blanketConsent # uncomment this line to use the script
	    blanketConsent=${blanketConsent^^}
	    if [ "$blanketConsent" = "Y" ]
	    then
		gitConsent="Y"
		personalConsent="Y"
		emacsConsent="Y"
		tmuxConsent="Y"
		bashConsent="Y"
	    fi
	fi
	
	if [ "$blanketConsent" = "N" ]
	then
	    printf "Configure git? (Y/n) "
	    read gitConsent # uncomment this line to use the script
	    gitConsent=${gitConsent^^}
	    
	    if [ "$gitConsent" = "Y" ]
	    then
		printf "Personalize git (do not agree if you did not write this code)? (Y/n) "
		read personalConsent # uncomment this line to use the script
		personalConsent=${personalConsent^^}
	    fi
	    
	    printf "Configure emacs? (Y/n) "
	    read emacsConsent # uncomment this line to use the script
	    emacsConsent=${emacsConsent^^}
	    
	    printf "Configure tmux? (Y/n) "
	    read tmuxConsent # uncomment this line to use the script
	    tmuxConsent=${tmuxConsent^^}
	    
	    printf "Configure bash? (Y/n) "
	    read bashConsent # uncomment this line to use the script
	    bashConsent=${bashConsent^^}
	fi
	
    fi
}

function areSame {
    if cmp --silent "$1" "$2";
    then

	printf "No changes required.\n"
	notsame=0
    else

	printf "Making changes to "
	notsame=1
    fi
}


