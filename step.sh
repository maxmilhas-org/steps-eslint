#!/bin/bash

set -e

ESLINT=${path}

# Change the working dir if necessary
if [ ! -z "${workdir}" ] ; then
    echo "==> Switching to working directory: ${workdir}"
    cd "${workdir}"
    if [ $? -ne 0 ] ; then
        echo " [!] Failed to switch to working directory: ${workdir}"
        exit 1
    fi
fi

if which ${ESLINT} > /dev/null; then
    echo "==> ESLint already installed."
else
    echo "==> ESLint not installed."
    if which npm > /dev/null; then
        echo "==> Installing ESLint version ${version}"
        npm install eslint@${version} -g
    else
        echo " [!] Error: npm not found!"
        exit 1
    fi
fi

cd ${workdir}
${ESLINT} ${args}