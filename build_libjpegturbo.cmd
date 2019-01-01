
set OPTIONS=-DENABLE_SHARED=FALSE -DREQUIRE_SIMD=TRUE -DWITH_ARITH_DEC=FALSE -DWITH_ARITH_ENC=FALSE -DWITH_CRT_DLL=TRUE -DCMAKE_ASM_NASM_COMPILER:PATH=%~dp0\nasm.exe

rd /s /q libjpeg-turbo-release
mkdir libjpeg-turbo-release && cd libjpeg-turbo-release

cmake -DCMAKE_BUILD_TYPE=Release -G"Ninja" -DCMAKE_INSTALL_PREFIX:PATH=%~dp0\out\libjpeg-turbo-release\ %OPTIONS% ..\libjpeg-turbo 

ninja -j4 install

cd ..

rd /s /q libjpeg-turbo-debug
mkdir libjpeg-turbo-debug && cd libjpeg-turbo-debug

cmake -DCMAKE_BUILD_TYPE=Debug -G"Ninja" -DCMAKE_INSTALL_PREFIX:PATH=%~dp0\out\libjpeg-turbo-debug\ %OPTIONS% ..\libjpeg-turbo 

ninja -j4 install

cd ..
