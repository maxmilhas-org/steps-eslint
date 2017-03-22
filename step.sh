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
    echo "TSLint already installed."
else
    echo "TSLint not installed. Installing using npm..."
    if which npm > /dev/null then;
        echo "Error: npm not found!"
        exit 1
    fi
    npm install tslint@${version} -g
fi

cd ${workdir}
${TSLINT} ${args}