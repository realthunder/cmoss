#!/bin/bash
set -e

PKG_NAME=log4c
PKG_VERSION=1.2.1
PKG_URL=http://nchc.dl.sourceforge.net/project/log4c/log4c/$PKG_VERSION

. `dirname $0`/common.sh
env_setup $@

pkg_setup $@
cd $PKG_DIR

${TOPDIR}/patch.sh $PKG_NAME -v $PKG_VERSION || exit 1

call_configure ac_cv_lib_pthread_pthread_mutex_init=yes ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes ${CONFIG_FLAGS} --without-expat --with-gnu-ld

make ${MAKE_FLAGS}
make install

