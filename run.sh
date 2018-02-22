#!/bin/sh

while read line
do
	export "CI_TEACHER_ACCOUNT=$line"
	echo "$CI_TEACHER_ACCOUNT" | base64 -d
	echo
	for VARIABLE in {1..9}
	do
		echo "第${VARIABLE}次尝试"
		if [ "${CI-}" ]; then
			(npm run -s start 2> /dev/null) && sleep 5 && break
		else
			npm run -s start && sleep 5 && break
		fi
		sleep 1
	done
done < account.txt
