# xbin

Your serverless toolkit.

## Install

Copy and paste the content from [`xbin.zsh`](./xbin.zsh)(Or
[`xbin.sh`](./xbin.sh) if you use Bash) to you current shell.

(This will work only for the current shell, if you want `xbin` always work under
your shell, you need to put the function (the content of the `xbin.zsh`) into
your `~/.zshrc`, so that `xbin` will be always available for you)

## Usage

Just put `xbin` before the command that you want to run.

Like this:

![](./docimages/xbin-example.png)

## Caveats

If you have `"`(quotes) in your command args, you need to use single quotes to
quote all args.

Because of the commands' args was passed to xbin.io via HTTP headers, So
`xbin jq -C ".[0] | keys"` will be passed as `X-Args: -C .[0] | keys` in the
headers, then when xbin.io received your request, it will see `-C .[0] | keys`
as arg list, AKA, 4 args in this command: `-C` `.[0]` `|` `keys`. So the correct
way is calling like this: `xbin jq -C '".[0] | keys"'`, or
`xbin jq '-C ".[0] | keys"'`, then the double quotes will be kept in HTTP
headers: `X-Args: -C ".[0] | keys"`, xbin.io will think your command as
`jq -C ".[0] | keys"`, there are only two args, which is correct.
