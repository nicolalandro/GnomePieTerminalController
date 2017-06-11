# sudo apt install xmlstarlet
# cat ~/.config/gnome-pie/pies.conf
# xml=$(cat ./pies.conf)

#!/bin/bash
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
	xmlstarlet sel -t -v "//pies/pie/@name" $1
	newLine
}

printfLightYellow "start"
newLine

if [ "$#" -ne 1 ]; then
	helpMessage
elif [ "$1" == "-showPies" ]; then
 	showPies "./pies.conf"
else
	helpMessage
fi

printfLightYellow "end"
newLine
