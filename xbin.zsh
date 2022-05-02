% function xbin() {
  command="$1"
  args="${*:2}"
  if [ -t 0 ]; then
    curl -X POST "https://xbin.io/${command}" -H "X-Args: ${args}"
  else
    curl --data-binary @- "https://xbin.io/${command}" -H "X-Args: ${args}"
  fi
}
