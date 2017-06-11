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
	printf "\t-piePrograms: show all programs of a pie, specified by name\n"
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
	newLine
}

function addInPie {
	# <slice type="app" name="Audacity" icon="audacity" command="env UBUNTU_MENUPROXY=0 audacity %F" quickAction="false"/>

    # xmlstarlet ed --subnode "//root" --type elem -n newsubnode -v "TEXT GOES HERE" input.xml 
    #| xmlstarlet ed --insert //newsubnode --type attr -n attrname -v attrvalue > output.xml
	printf "da implementare"
}

printfLightYellow "start"
newLine

case "$1" in
	-showPies)
		showPies
		;;
	-h|-help)
		helpMessage
		;;
	-piePrograms)
		launcherOfPie "$2"
		;;
	*)
		helpMessage
		;;
esac

printfLightYellow "end"
newLine
