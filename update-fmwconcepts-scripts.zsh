#!/usr/bin/env zsh
trap cleanup SIGINT SIGTERM ERR EXIT

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  killall -9 curl
}

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

bin_root="${0:a:h}/bin"

# update scripts list


scripts=(
  $(
    curl http://www.fmwconcepts.com/imagemagick/script_list.txt \
      | awk '{ print $1 }' script_list.txt
  )
)

(( $+functions[log-line] )) || function log-line() {
    print -u2 "$@"
}

for script in $scripts ; {
    log-line "downloading $script"
    curl \
        --silent \
        -o $bin_root/im-$script \
        "http://www.fmwconcepts.com/imagemagick/downloadcounter.php?scriptname=$script&dirname=$script"
    break
}
