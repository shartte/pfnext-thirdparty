
rd /s /q flatbuffers-release
mkdir flatbuffers-release
cd flatbuffers-release
cmake ..\flatbuffers -G Ninja ^
-DCMAKE_BUILD_TYPE=Release ^
-DCMAKE_INSTALL_PREFIX:PATH=..\out\flatbuffers-release\

..\ninja.exe -j4
..\ninja install

cd ..\

rd /s /q flatbuffers-debug
mkdir flatbuffers-debug
cd flatbuffers-debug
cmake ..\flatbuffers -G Ninja ^
-DCMAKE_BUILD_TYPE=Debug ^
-DCMAKE_INSTALL_PREFIX:PATH=..\out\flatbuffers-debug\

..\ninja.exe -j4
..\ninja install

cd ..\
