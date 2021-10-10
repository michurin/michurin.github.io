{
  "git": [.[0][]|select(.fork|not)|{(.name):{"desc":.description,"stars":.stargazers_count,"forks":.forks_count,"lang":.language}}]|add,
  "cov": [.[1].repos[]|{(.name):{"branch":.branch,"coverage":.coverage}}]|add,
  "data": .[2]
}
