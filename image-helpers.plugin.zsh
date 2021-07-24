0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Then ${0:h} to get plugin’s directory

path+=( "${0:h}/bin" )

: ${IMAGE_HELPERS_PREFIX:=1}

if (( IMAGE_HELPERS_PREFIX == 0 )) {
    # todo, add aliases for all im-*
}
