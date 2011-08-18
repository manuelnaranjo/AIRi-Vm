#!/bin/bash -ex

TARGET="AIRi-VirtualBox-$(date +%s)"
CWD=$(pwd)

sudo ./vmbuilder vbox ubuntu \
    -c vmbuilder.cfg \
    --templates=templates \
    --copy $CWD/copy-files \
    --exec $CWD/post-install.sh \
    --firstboot $CWD/first-boot.sh \
    -v --debug -d ${TARGET} 2>&1 | tee build.log

sudo chown -R $(whoami):$(whoami) $TARGET

zip -9 -r $TARGET.zip $TARGET
