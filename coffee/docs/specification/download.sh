versions=(
  6
  7
  8
  9
  10
  11
  12
  13
  14
  15
  16
  17
  18
)

function jls() {
  if [ $1 == 6 ]; then
    if [ ! -f jls3.pdf ]; then
      curl -OL https://docs.oracle.com/javase/specs/jls/se6/jls3.pdf
    fi
  else
    if [ ! -f jls$1.pdf ]; then
      curl -OL https://docs.oracle.com/javase/specs/jls/se$1/jls$1.pdf
    fi
  fi
}

function jvms() {
  if [ $1 != 6 ]; then
    if [ ! -f jvms$1.pdf ]; then
      curl -OL https://docs.oracle.com/javase/specs/jvms/se$1/jvms$1.pdf
    fi
  fi
}

for version in ${versions[@]}; do
  jls $version
  jvms $version
done
