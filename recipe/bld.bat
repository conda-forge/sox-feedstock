@echo on

mkdir build
cd build

cmake -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_BINDIR="%LIBRARY_PREFIX%\bin" ^
    -DCMAKE_INSTALL_INCLUDEDIR="%LIBRARY_PREFIX%\include" ^
    -DCMAKE_INSTALL_LIBDIR="%LIBRARY_PREFIX%\lib" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
    -DSOX_VERSION="14.4.2" ^
    -DSOX_BUILD_EXAMPLES=OFF ^
    -DBUILD_SHARED_LIBS=OFF ^
    -D_CRT_SECURE_NO_WARNINGS=ON ^
    -D_CRT_SECURE_NO_DEPRECATE=ON ^
    -D_CRT_NONSTDC_NO_DEPRECATE=ON ^
    ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build . --verbose --config Release --
if %ERRORLEVEL% neq 0 exit 1

cmake --install .  --verbose --config Release
if %ERRORLEVEL% neq 0 exit 1
