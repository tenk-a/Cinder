pushd .

if "%VS141_DIR%"=="" call set_vs2017.bat

pushd ..\..\blocks

git clone https://github.com/simongeilfus/Cinder-ImGui.git ImGui

pushd ImGui
git submodule update -i

pushd proj

if exist vc2017 goto SKIP1
mkdir vc2017
if exist vc2015 copy /b vc2015\*.* vc2017\
:SKIP1

pushd vc2017

devenv /Upgrade Cinder-ImGui.sln

call "%VC141_DIR%\VC\Auxiliary\Build\vcvars64.bat"

msbuild Cinder-ImGui.sln /t:Build /p:Platform=x64 /p:Configuration=Release
msbuild Cinder-ImGui.sln /t:Build /p:Platform=x64 /p:Configuration=Release_Shared
msbuild Cinder-ImGui.sln /t:Build /p:Platform=x64 /p:Configuration=Debug
msbuild Cinder-ImGui.sln /t:Build /p:Platform=x64 /p:Configuration=Debug_Shared

call "%VC141_DIR%\VC\Auxiliary\Build\vcvars32.bat"

msbuild Cinder-ImGui.sln /t:Build /p:Platform=x86 /p:Configuration=Release
msbuild Cinder-ImGui.sln /t:Build /p:Platform=x86 /p:Configuration=Release_Shared
msbuild Cinder-ImGui.sln /t:Build /p:Platform=x86 /p:Configuration=Debug
msbuild Cinder-ImGui.sln /t:Build /p:Platform=x86 /p:Configuration=Debug_Shared

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
