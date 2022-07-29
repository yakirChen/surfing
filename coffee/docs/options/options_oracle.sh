#!/usr/bin/env zsh

vs=(
  1.8
  11
  17
  19
)


for v in ${vs[@]};
do
  /usr/libexec/java_home -v ${v} --exec java -XX:+PrintFlagsFinal -XX:+UnlockDiagnosticVMOptions -XX:+UnlockExperimentalVMOptions -version > oracle/jvm_$v.vmoptions
done



