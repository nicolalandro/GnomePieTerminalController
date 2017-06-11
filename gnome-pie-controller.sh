# sudo apt install xmlstarlet
# cat ~/.config/gnome-pie/pies.conf
# xml=$(cat ./pies.conf)

#!/bin/bash
path="./pies.conf"

function printfLightYellow {
	printf "\033[93m$1\e[0m"
}

function helpMessage {
	printfLightYellow "...Help Message...\n"
	printf "\t-showPies: show all pies name\n"
}

function newLine {
	printf "\n"
}

function showPies {
	xmlstarlet sel -t -v "//pies/pie/@name" $path
	newLine
}

function launcherOfPie {
	xmlstarlet sel -t -v "//pies/pie[@name='$1']/slice/@name" $path
}

printfLightYellow "start"
newLine

if [ "$#" -ne 1 ]; then
	helpMessage
elif [ "$1" == "-showPies" ]; then
 	showPies
elif [ "$1" == "-pieProgram" ]; then 
	launcherOfPie "Music"
else
	helpMessage
fi

printfLightYellow "end"
newLine
