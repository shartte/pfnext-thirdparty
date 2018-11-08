
rd /s /q glfw-release
mkdir glfw-release
cd glfw-release
cmake ..\glfw -G Ninja ^
-DCMAKE_BUILD_TYPE=Release ^
-DCMAKE_INSTALL_PREFIX:PATH=..\out\glfw-release\

..\ninja.exe -j4
..\ninja install

cd ..\

rd /s /q glfw-debug
mkdir glfw-debug
cd glfw-debug
cmake ..\glfw -G Ninja ^
-DCMAKE_BUILD_TYPE=Debug ^
-DCMAKE_INSTALL_PREFIX:PATH=..\out\glfw-debug\

..\ninja.exe -j4
..\ninja install

cd ..\