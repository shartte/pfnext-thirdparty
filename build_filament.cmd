
rd /s /q filament-release
mkdir filament-release
cd filament-release
cmake ..\filament -G Ninja ^
-DCMAKE_CXX_COMPILER:PATH="C:\Program Files\LLVM\bin\clang-cl.exe" ^
-DCMAKE_C_COMPILER:PATH="C:\Program Files\LLVM\bin\clang-cl.exe" ^
-DCMAKE_LINKER:PATH="C:\Program Files\LLVM\bin\lld-link.exe" ^
-DCMAKE_BUILD_TYPE=Release ^
-DCMAKE_INSTALL_PREFIX:PATH=%~dp0\out\filament-release\ ^
-DUSE_STATIC_CRT=OFF ^
-DENABLE_JAVA=OFF

..\ninja.exe -j4
..\ninja install

cd ..\

pause

rd /s /q filament-debug
mkdir filament-debug
cd filament-debug
cmake ..\filament -G Ninja ^
-DCMAKE_CXX_COMPILER:PATH="C:\Program Files\LLVM\bin\clang-cl.exe" ^
-DCMAKE_C_COMPILER:PATH="C:\Program Files\LLVM\bin\clang-cl.exe" ^
-DCMAKE_LINKER:PATH="C:\Program Files\LLVM\bin\lld-link.exe" ^
-DCMAKE_BUILD_TYPE=Debug ^
-DCMAKE_INSTALL_PREFIX:PATH=%~dp0\out\filament-debug\ ^
-DUSE_STATIC_CRT=OFF ^
-DENABLE_JAVA=OFF

..\ninja.exe -j4
..\ninja install

cd ..\
