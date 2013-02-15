
base=$1
target="$base.byte"

export OCAMLRUNPARAM='b' #backtrace

build() {
  # -l&cflag -g , to enable backtraces
  # yaccflag --trace , to enable parser trace
  ocamlbuild -use-menhir -lflag -g -cflag -g -yaccflags -v,--trace,--graph -libs unix,str,nums $1
}

build $target && ./$target 2> parser-actions.log

