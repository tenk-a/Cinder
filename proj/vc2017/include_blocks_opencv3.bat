pushd .

if "%VS141_DIR%"=="" call set_vs2017.bat

pushd ..\..\blocks

git clone https://github.com/Cinder/Cinder-OpenCV3.git OpenCV3

pushd OpenCV3
git submodule update -i

pushd samples
call :cnv_sample ocvBasic
call :cnv_sample ocvCapture
call :cnv_sample ocvColorQuantize
call :cnv_sample ocvFaceDetect
call :cnv_sample ocvOpticalFlow
call :cnv_sample ocvPerspective
call :cnv_sample ocvWarp

popd

:cnv_sample
set TgtName=%1
pushd %TgtName%

if exist vc2017 goto SKIP1
mkdir vc2017
if exist vc2015 copy /b vc2015\*.* vc2017\
:SKIP1

pushd vc2017

devenv /Upgrade %TgtName%.sln

call "%VS150COMNTOOLS%..\..\VC\Auxiliary\Build\vcvars64.bat"

msbuild %TgtName%.sln /t:Build /p:Platform=x64 /p:Configuration=Release
msbuild %TgtName%.sln /t:Build /p:Platform=x64 /p:Configuration=Release_Shared
msbuild %TgtName%.sln /t:Build /p:Platform=x64 /p:Configuration=Debug
msbuild %TgtName%.sln /t:Build /p:Platform=x64 /p:Configuration=Debug_Shared

call "%VS150COMNTOOLS%..\..\VC\Auxiliary\Build\vcvars32.bat"

msbuild %TgtName%.sln /t:Build /p:Platform=x86 /p:Configuration=Release
msbuild %TgtName%.sln /t:Build /p:Platform=x86 /p:Configuration=Release_Shared
msbuild %TgtName%.sln /t:Build /p:Platform=x86 /p:Configuration=Debug
msbuild %TgtName%.sln /t:Build /p:Platform=x86 /p:Configuration=Debug_Shared

popd

popd

pushd samples\Basic

if exist vc2017 goto SKIP1
mkdir vc2017
if exist vc2015 copy /b vc2015\*.* vc2017\
:SKIP1

pushd vc2017

devenv /Upgrade Basic.sln

call "%VC141_DIR%\VC\Auxiliary\Build\vcvars64.bat"

msbuild Basic.sln /t:Build /p:Platform=x64 /p:Configuration=Release
msbuild Basic.sln /t:Build /p:Platform=x64 /p:Configuration=Debug

call "%VC141_DIR%\VC\Auxiliary\Build\vcvars32.bat"

msbuild Basic.sln /t:Build /p:Platform=Win32 /p:Configuration=Release
msbuild Basic.sln /t:Build /p:Platform=Win32 /p:Configuration=Debug

popd

popd
popd
popd
