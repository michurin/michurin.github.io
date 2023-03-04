.PHONY: all clean vanish check long-check ci

all: check

%.html: %.tmpl %.json
	j2 $^ >$@ # jinja2 is also working
index.json: index.jq api_repos.json api_codecov.json sections.json
	jq -Ss -f $^ >$@

api_repos.json:
	curl -s https://api.github.com/users/michurin/repos?per_page=100 | jq -S . >$@
api_codecov.json:
	echo "*** SKIP CODECOV***" # [04032023] codecov API flaking: 500 with random reasons and 200 but without context
	curl -s https://codecov.io/api/gh/michurin | jq '{meta, error}' # [04032023] just to have diagnostics in logs
	#curl -s https://codecov.io/api/gh/michurin | jq -S . >$@

clean:
	rm index.json
vanish:
	rm index.html index.json api_repos.json # api_codecov.json # [04032023] keep old codecov response
check: check.xslt index.html
	xsltproc $^
long-check:
	make check | sed -n 's/.*\(http[^[:space:]]*\).*/curl -o \/dev\/null -sw "%{http_code}\\n" \1/p' | sh -x
ci: # as far as git doesn't care about ctime, we are make this rule for github actions
	xsltproc check.xslt index.html
