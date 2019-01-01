
rd /s /q glm-build
mkdir glm-build
cd glm-build
cmake ..\glm -G Ninja ^
-DGLM_QUIET=ON ^
-DCMAKE_INSTALL_PREFIX:PATH=%~dp0\out\glm\

..\ninja.exe -j4
..\ninja install

cd ..\
