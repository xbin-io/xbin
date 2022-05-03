function xbin
    set command $argv[1]
    set args $argv[2..-1]
    if test -t 0
        curl -sS -X POST "https://xbin.io/$command" -H "X-Args: $args"
    else
        curl -sS --data-binary @- "https://xbin.io/$command" -H "X-Args: $args"
    end
end
