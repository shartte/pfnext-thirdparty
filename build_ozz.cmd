
rd /s /q ozz-release
mkdir ozz-release
cd ozz-release
cmake ..\ozz-animation -G Ninja ^
-DCMAKE_BUILD_TYPE=Release ^
-DCMAKE_INSTALL_PREFIX:PATH=..\out\ozz-release\

..\ninja.exe -j4
..\ninja install

cd ..\

rd /s /q ozz-debug
mkdir ozz-debug
cd ozz-debug
cmake ..\ozz-animation -G Ninja ^
-DCMAKE_BUILD_TYPE=Debug ^
-DCMAKE_INSTALL_PREFIX:PATH=..\out\ozz-debug\

..\ninja.exe -j4
..\ninja install

cd ..\