#!/bin/sh

# It seems it doesn't work anymore
#
# for i in 1 2 3 4 5
# do
#     echo "Take $i..."
#     curl -qs https://codecov.io/api/gh/michurin --retry 10 | jq -r '.repos[].name' | sort >list.tmp
#     if test -s list.tmp
#     then
#         echo "list.tmp seems ok"
#         echo "===="
#         cat list.tmp
#         echo "==== EOF"
#         exit
#     else
#         echo "list.tmp is empty; we are going to sleep"
#         sleep 1
#     fi
# done

#echo "We are falling back :-("
# fallback if codecov api is unreachable again :-(
cat <<LIST >list.tmp
cnbot
human-readable-json-logging
jsonpainter
milisp
minlog
netpunch
ngramindex
pprofiler
systemd-env-file
tc
LIST
