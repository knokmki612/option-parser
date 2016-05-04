#!/bin/sh
while [ $# -gt 0 ]; do
	if echo $1 | grep -sq '\-\-.*'; then
		case $1 in
			--hello-a)
				echo 'hello a'
				;;
			--hello-b)
				echo 'hello b'
				;;
			--*)
				echo "invalid long option: $1"
				exit 1
				;;
		esac
		shift 1
		continue
	elif echo $1 | grep -sq '\-.*'; then
		for shortopt in $(echo $1 | grep -o .); do
			case $shortopt in
				-)
					continue
					;;
				a)
					echo 'hello a'
					;;
				b)
					echo 'hello b'
					;;
				*)
					echo "invalid option: -$shortopt"
					exit 1
					;;
			esac
		done
		shift 1
		continue
	else
		:
	fi
done
