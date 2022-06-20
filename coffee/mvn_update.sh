#!/usr/bin/env zsh

mvn dependency:analyze
mvn versions:display-property-updates
mvn versions:display-dependency-updates
mvn versions:display-plugin-updates
