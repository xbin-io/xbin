% function xbin() {
  command="$1"
  args="${@:2}"
  if [ -t 0 ]; then
    curl -X POST 127.0.0.1:5000/${command} -H "X-Args: ${args}"
  else
    curl --data-binary  @- 127.0.0.1:5000/${command} -H "X-Args: ${args}"
  fi
}
