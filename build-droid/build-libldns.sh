#!/bin/sh
set -e

PKG_NAME=ldns
PKG_VERSION=1.6.17
PKG_URL=http://www.nlnetlabs.nl/downloads/ldns

. `dirname $0`/common.sh
env_setup $@

pkg_setup $@
cd $PKG_DIR

LDFLAGS="-Os -pipe -isysroot ${SYSROOT}"

#call_configure --host=${ARCH}-android-linux --target=${PLATFORM} --prefix=${SYSROOT}/usr --disable-gost 
call_configure --host=${ARCH}-android-linux --target=${PLATFORM} --prefix=${SYSROOT}/usr --disable-gost --disable-dane --disable-ecdsa --without-ssl --disable-sha2 

${TOPDIR}/helper/patch.sh $PKG_NAME -v $PKG_VERSION || exit 1

make && make install-h install-lib install-config
