#!/bin/sh -ex

curl -s https://codecov.io/api/gh/michurin --retry 10 | jq -r '.repos[].name' | sort >list.tmp
