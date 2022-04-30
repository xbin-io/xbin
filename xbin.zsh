% function xbin() {
  command="$1"
  args="${@:2}"
  if [ -t 0 ]; then
    curl -sS -X POST "https://xbin.io/${command}" -H "X-Args: ${args}"
  else
    curl -sS --data-binary @- "https://xbin.io/${command}" -H "X-Args: ${args}"
  fi
}
