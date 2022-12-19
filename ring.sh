#!/bin/bash
# V=0.21
# todo
	# help --> Write how to use when differten pings are installed
	# differten ping versions
	# markup how to use and how to instlal


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
	# check input para 1 if it is a number, no input check for para 2
	if  ! echo "$1" | egrep -q '^[0-9]+$' ; then
		echo "How to use"
		exit 1
	fi

	# chek para 2
	if echo "$2" | egrep -q '^[0-9]+$' ; then
		# we get a number, so we assign it. Otherwise it is devault para
		BING_TYPE="$2"
	fi

	ring "$1" "$BING_TYPE" &
}

main "$1" "$2"
