
rd /s /q bullet3-release
mkdir bullet3-release && cd bullet3-release

cmake -DCMAKE_BUILD_TYPE=Release -DINSTALL_LIBS=ON -G"Ninja" -DCMAKE_INSTALL_PREFIX:PATH=%~dp0\out\bullet3-release\ -DUSE_MSVC_RUNTIME_LIBRARY_DLL=ON ..\bullet3 

ninja -j4 install

cd ..

rd /s /q bullet3-debug
mkdir bullet3-debug && cd bullet3-debug

cmake -DCMAKE_BUILD_TYPE=Debug -DINSTALL_LIBS=ON -G"Ninja" -DCMAKE_INSTALL_PREFIX:PATH=%~dp0\out\bullet3-debug\ -DUSE_MSVC_RUNTIME_LIBRARY_DLL=ON ..\bullet3 

ninja -j4 install

cd ..
