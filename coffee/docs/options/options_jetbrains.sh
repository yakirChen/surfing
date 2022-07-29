#!/usr/bin/env zsh


BASE_DIR=/Users/yakir/local/jbr

vs=(
  jbr_jcef-17.0.3-x64-b469
)


for v in ${vs[@]};
do
  cv=$(echo $v | awk  -F '-' '{print $2}')
  ${BASE_DIR}/${v}/Contents/Home/bin/java -XX:+PrintFlagsFinal -XX:+UnlockDiagnosticVMOptions -XX:+UnlockExperimentalVMOptions -version > jetbrains/jbr_$cv.vmoptions
done
