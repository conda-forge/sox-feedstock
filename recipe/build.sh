#! /usr/bin/env bash



cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=${PREFIX}/lib \
              -DCMAKE_INSTALL_INCLUDEDIR=${PREFIX}/include \
              -DCMAKE_INSTALL_PREFIX=${PREFIX} \
               -DSOX_BUILD_EXAMPLES=OFF -DBUILD_SHARED_LIBS=ON  .


cmake --build . --verbose --config Release -- -v -j ${CPU_COUNT}

cmake --install . --verbose --config Release


