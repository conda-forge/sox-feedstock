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
# only run tests during build phase if not cross-compiling for osx-arm64
if [[ $(uname) != Darwin || $(uname -m) != arm64 ]]; then
    make bindir=. installcheck
fi
make install
