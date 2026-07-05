REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOAD_DIR=%USERPROFILE%\Downloads
set DOWNLOAD_DIR_LINUX=%DOWNLOAD_DIR:\=/%

set PREFIX=%DOWNLOAD_DIR%
@REM set PREFIX=D:\Softwares

SET PATH=^
%SystemRoot%\System32;^
%PREFIX%\PortableGit\bin;^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64;^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin;^
%PREFIX%\cmake-3.29.3-windows-x86_64\cmake-3.29.3-windows-x86_64\bin;

cmake.exe -G"MinGW Makefiles" ^
-DCMAKE_BUILD_TYPE=Release ^
-B./cmake-build &&^
cd cmake-build &&^
cmake --build . &&^
pause

cd /d "%~dp0"
