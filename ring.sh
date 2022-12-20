#!/bin/bash
# V=0.31

# BING_TYPE
# 0 All signals
# 1 Terminal beep
# 2 Usage of speech-dispatcher spd-say
# 3 Visual output
BING_TYPE=0;

function bing(){
	echo "---------------- Time is up, Tee is now ready ! It is: " $(date)

	# case 1 or 0
	if [ 1 -eq "$1" ] || [ 0 -eq "$1" ]  ; then
		for i in `seq 5`; do
			echo -en "\007" > /dev/tty  2>/dev/null
			sleep 0.2;
		done
	fi

	# case 2 or 0
	if [ 2 -eq "$1" ] || [ 0 -eq "$1" ]  ; then
		spd-say "Ring"  2> /dev/null
	fi

	# case 3 or 0
	if [ 3 -eq "$1" ] || [ 0 -eq "$1" ]  ; then
		echo "  _____    _                     _ ";
		echo " |  __ \  (_)                   | |";
		echo " | |__) |  _   _ __     __ _    | |";
		echo " |  _  /  | | | '_ \   / _\` |   | |";
		echo " | | \ \  | | | | | | | (_| |   |_|";
		echo " |_|  \_\ |_| |_| |_|  \__, |    _ ";
		echo "                        __/ |   (_)";
		echo "                       |___/       ";
	fi
}

function help(){
	echo '# Ring'
	echo ''
	echo '## _Ring the alarm_ '
	echo ''
	echo 'ring is a simple console based alarm clock. It can be run from the shell, but also from the git-bash '
	echo 'which comes with the git installation. So it can run on nearly any system that has git installed. '
	echo ''
	echo '## Usage: '
	echo ''
	echo 'ring [minutes to alarm] [alarm type]'
	echo 'e.g. alarm after 1 minute: '
	echo ''
	echo 'ring 1 '
	echo ''
	echo 'Since the system signal tone is different on every system different signal forms are supported for [alarm type]:'
	echo ''
	echo '[alarm type] = 0 : Default: All alarm types are used '
	echo '[alarm type] = 1 : Uses terminal beep. '
	echo '[alarm type] = 2 : 2 Usage of speech-dispatcher “spd-say”'
	echo '[alarm type] = 3 : Visual output'
	echo ''
}

function ring(){
	# timer
	for i in `seq "$1" -1 1 `; do
		#echo -en "\007" ;
		echo "Timer running." "$i" " Minutes left"
		sleep 60;
	done

	bing "$2"
}

function main(){
	# check input para 1, if it is a number
	if  ! echo "$1" | egrep -q '^[0-9]+$' ; then
		help
		exit 1
	fi

	# chek para 2
	if echo "$2" | egrep -q '^[0-9]+$' ; then
		# we get a number, so we assign it. Otherwise it is default para
		BING_TYPE="$2"
	fi

	ring "$1" "$BING_TYPE" &
}

main "$1" "$2"
