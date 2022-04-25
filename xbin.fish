function xbin
    set command $argv[1]
    set args $argv[2..]
    if test -t 0
        curl -X POST "https://xbin.io/$command" -H "X-Args: $args"
    else
        curl --data-binary @- "https://xbin.io/$command" -H "X-Args: $args"
    end
end
