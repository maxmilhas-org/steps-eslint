#!/bin/bash

set -e

TSLINT=${tslint_path}

# Change the working dir if necessary
if [ ! -z "${tslint_workdir}" ] ; then
  echo "==> Switching to working directory: ${tslint_workdir}"
  cd "${tslint_workdir}"
  if [ $? -ne 0 ] ; then
    echo " [!] Failed to switch to working directory: ${tslint_workdir}"
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

cd ${tslint_workdir}
${TSLINT} ${tslint_args}