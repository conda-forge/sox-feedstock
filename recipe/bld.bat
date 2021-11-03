setlocal EnableDelayedExpansion

cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR="!PREFIX!\Library\lib" -DCMAKE_INSTALL_INCLUDEDIR="!PREFIX!\Library\include" ^
                 -DCMAKE_INSTALL_BINDIR="!PREFIX!\Library\bin" ^
                 -DSOX_VERSION="14.4.2" ^
                 -DSOX_BUILD_EXAMPLES=OFF -DBUILD_SHARED_LIBS=OFF ^
                 -D_CRT_SECURE_NO_WARNINGS=ON -D_CRT_SECURE_NO_DEPRECATE=ON -D_CRT_NONSTDC_NO_DEPRECATE=ON ^
                -DCMAKE_INSTALL_PREFIX="!LIBRARY_PREFIX!" -DCMAKE_PREFIX_PATH:PATH="!LIBRARY_PREFIX!"  ^
                 .

cmake --build . --verbose --config Release --

cmake --install .  --verbose --config Release
