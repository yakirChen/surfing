#!/usr/bin/env zsh

cd src/main/java
/Library/Java/JavaVirtualMachines/jdk-19.jdk/Contents/Home/bin/java -Xmx2048m \
  --source 19 \
  --enable-preview \
  --add-modules jdk.incubator.concurrent \
  io/github/yakirchen/coffee/ThreadVirtual.java
cd -
