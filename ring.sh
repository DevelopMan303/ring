#!/bin/bash
# V=0.20
# todo
	# help --> Write how to use when differten pings are installed
	# differten ping versions
	# markup how to use and how to instlal


# BING_TYPE
# 0 All signals
# 1 Teminal beep
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
		echo " |_|  \_\ |_| |_| |_|  \__, |   (_)";
		echo "                        __/ |      ";
		echo "                       |___/       ";
	fi
}

function ring(){
	# check input
	if  echo "$1" | egrep -q '^[0-9]+$' ; then
		#echo "ist ne zahl"
		# counts down and inform user
		for i in `seq "$1" -1 1 `; do
			#echo -en "\007" ;
			echo "Timer running." "$i" " Minutes left"
			sleep 60;
		done

		# do the bing
		bing $BING_TYPE

	else
		echo "How to use"
	fi
}

# start in background
ring $1 &
