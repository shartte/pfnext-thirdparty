
rd /s /q zstd-release
mkdir zstd-release
cd zstd-release
cmake ..\zstd\build\cmake -G Ninja ^
-DCMAKE_BUILD_TYPE=Release ^
-DCMAKE_INSTALL_PREFIX:PATH=..\out\zstd-release\

..\ninja.exe -j4
..\ninja install

cd ..\

rd /s /q zstd-debug
mkdir zstd-debug
cd zstd-debug
cmake ..\zstd\build\cmake -G Ninja ^
-DCMAKE_BUILD_TYPE=Debug ^
-DCMAKE_INSTALL_PREFIX:PATH=..\out\zstd-debug\

..\ninja.exe -j4
..\ninja install

cd ..\