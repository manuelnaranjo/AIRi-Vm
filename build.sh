#!/bin/bash -ex

TARGET="ubuntu-$(date +%s)"
CWD=$(pwd)

sudo vmbuilder vbox ubuntu \
    -c vmbuilder.cfg \
    --templates=templates \
    --copy $CWD/copy-files \
    --exec $CWD/post-install.sh \
    --firstboot $CWD/first-boot.sh \
    -v --debug -d ${TARGET} 2>&1 | tee build.log

sudo chown -R $(whoami):$(whoami) $TARGET
