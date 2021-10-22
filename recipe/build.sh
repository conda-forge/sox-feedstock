#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

libtoolize
aclocal
autoheader
automake --add-missing
autoreconf -fiv

source activate "${CONDA_DEFAULT_ENV}"
./configure \
    --prefix=$PREFIX \
    --exec-prefix=$PREFIX \
    --without-opus \
    --without-flac
make
make bindir=. installcheck
make install
