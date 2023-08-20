#!/bin/sh -ex

output='api_codecov.json.tmp'

echo '{' >"$output"
sep=''
for repo in $(cat list.tmp)
do
    echo "REPO: $repo"
    url="https://codecov.io/gh/michurin/$repo/branch/master/graph/badge.svg"
    echo "URL: $url"
    curl -s "$url" |
        tee "badge.$repo.svg.tmp" |
        perl -0777 -e '$_=<>; m/<text[^>]*>(\d{,3}%)</; print(q|'$sep'"'$repo'":"|.$1.q|"|);' >>"$output" # TODO use XSLT to extract coverage?
    sep=','
done
echo '}' >>"$output"

jq -S . <"$output" >api_codecov.json
