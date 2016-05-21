#!/bin/bash

source activate _build
./configure --prefix=$PREFIX --exec-prefix=$PREFIX
make
make bindir=. installcheck
make install
