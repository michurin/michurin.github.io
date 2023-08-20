.PHONY: all clean vanish check long-check ci

all: check

%.html: %.tmpl %.json
	j2 $^ >$@ # jinja2 is also working
index.json: index.jq api_repos.json api_codecov.json sections.json
	jq -Ss -f $^ >$@

api_repos.json:
	curl -s https://api.github.com/users/michurin/repos?per_page=100 | jq -S . >$@
api_codecov.json:
	# retries to avoid 500s
	# in Aug 2023 all repos[].coverage turns to null; so next line
	# gets useless
	# curl -s https://codecov.io/api/gh/michurin -v --retry 10 -o $@.tmp
	# jq -S . <$@.tmp >$@
	#
	# hackish script to extract code coverage from badges
	cd codecov && ./list.sh && ./cov.sh && cp api_codecov.json ../api_codecov.json

clean:
	rm index.json
vanish:
	rm index.html index.json api_repos.json api_codecov.json
check: check.xslt index.html
	xsltproc $^
long-check:
	make check | sed -n 's/.*\(http[^[:space:]]*\).*/curl -o \/dev\/null -sw "%{http_code}\\n" \1/p' | sh -x
ci: # as far as git doesn't care about ctime, we are make this rule for github actions
	xsltproc check.xslt index.html
