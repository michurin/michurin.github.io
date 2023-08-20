{
  "git": [.[0][]|select(.fork|not)|{(.name):{"desc":.description,"stars":.stargazers_count,"forks":.forks_count,"lang":.language}}]|add,
  "cov": .[1],
  "data": .[2]
}
