#!/usr/bin/env zsh

cd ../
mvn clean install -DskipTests
cd -
mvn clean package -DskipTests
java -Xmx2048m --enable-preview --add-modules=jdk.incubator.concurrent -jar target/coffee-jmh.jar

