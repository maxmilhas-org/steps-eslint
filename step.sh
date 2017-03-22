#!/bin/bash

set -e

TSLINT=${path}

# Change the working dir if necessary
if [ ! -z "${workdir}" ] ; then
    echo "==> Switching to working directory: ${workdir}"
    cd "${workdir}"
    if [ $? -ne 0 ] ; then
        echo " [!] Failed to switch to working directory: ${workdir}"
        exit 1
    fi
fi

if which ${TSLINT} > /dev/null; then
    echo "==> TSLint already installed."
else
    echo "==> TSLint not installed."
    if which npm > /dev/null; then
        if ! which tsc > /dev/null; then
            echo "==> TypeScript not installed. Installing TypeScript version ${typescript_version}"
            npm install typescript@{typescript_version} -g
        fi
    
        echo "==> Installing TSLint version ${version}"
        npm install tslint@${version} -g
    else
        echo " [!] Error: npm not found!"
        exit 1
    fi
fi

cd ${workdir}
${TSLINT} ${args}