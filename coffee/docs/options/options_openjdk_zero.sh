#!/usr/bin/env zsh


BASE_DIR=/Volumes/sm/github/jdk/jdkbuild

vs=(
  macosx-x86_64-zero-slowdebug
)


for v in ${vs[@]};
do
  cv=$(echo $v | awk  -F '-' '{print $2}')
  ${BASE_DIR}/build/${v}/jdk/bin/java -XX:+PrintFlagsFinal -XX:+UnlockDiagnosticVMOptions -XX:+UnlockExperimentalVMOptions -version > openjdk_zero/jvm.zero.vmoptions
done
