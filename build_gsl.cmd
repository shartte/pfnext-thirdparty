
rd /s /q gsl-build
mkdir gsl-build
cd gsl-build
cmake ..\gsl -G Ninja ^
-DCMAKE_BUILD_TYPE=Release ^
-DCMAKE_INSTALL_PREFIX:PATH=..\out\gsl\

..\ninja.exe -j4
..\ninja install

cd ..\
