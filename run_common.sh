#!/usr/bin/env zsh

echo "pwd: ${PWD}"
function mk_build() {
    if [[ ! -d .build ]]; then
        mkdir .build
    fi
}

function prompt() {
    echo "--------------------------------------------"
    echo "| ${LANGUAGE} run                        "
    for exe in ${EXECUTES[*]}; do
        echo "|      ${exe}"
    done
    echo "--------------------------------------------"
}

function read_arg() {
    if [[ ! -n $1 ]]; then
        read "?${LANGUAGE} run " name
    else
        name=$1
    fi
}
