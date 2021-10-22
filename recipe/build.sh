#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

libtoolize
aclocal
autoheader
automake --add-missing
autoreconf -fiv

source activate "${CONDA_DEFAULT_ENV}"
./configure --prefix=$PREFIX --exec-prefix=$PREFIX
make
# only run tests during build phase if not cross-compiling
if [[ "${HOST_PLATFORM}" == "${BUILD_PLATFORM}" ]]; then
    echo "HOST_PLATFORM: ${HOST_PLATFORM}"
    echo "BUILD_PLATFORM: ${BUILD_PLATFORM}"
    make bindir=. installcheck
fi
make install
