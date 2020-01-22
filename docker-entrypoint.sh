#!/bin/bash
set -e

TEMPDIR="/tmp"
DATADIR="/opt"
EXEPATH="/SmartFoxServer_2X/SFS2X"

# Start from version 2.14 Patches doesn't needed anymore
# https://www.smartfoxserver.com/download/sfs2x#p=updates

install_smartfox() {
    cd ${DATADIR}

    tar xf ${TEMPDIR}/SFS2X_unix_${SMARTFOX_VERSION}.tar.gz --skip-old-files
}

if [ "$1" = 'sfs2x' ]; then
    echo 'Executing smartfox docker entrypoint'

    if [ ! -f "$DATADIR$EXEPATH/sfs2x.sh" ]; then
        echo 'Smartfox folder does not exist trying to install'
        install_smartfox
    fi 

    echo 'Change directory to smartfox start shell'
    cd ${DATADIR}${EXEPATH}

    echo 'Start smartfox shell'
    exec "./sfs2x.sh"

fi