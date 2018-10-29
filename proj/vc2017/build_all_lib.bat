pushd .

if "%VS150COMNTOOLS%"=="" call set_vs2017.bat

setlocal

set "SAVEPATH=%PATH%"
call "%VS150COMNTOOLS%..\..\VC\Auxiliary\Build\vcvars64.bat"

msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Release
msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Release_ANGLE
msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Release_Shared

msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Debug
msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Debug_ANGLE
msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Debug_Shared

set "PATH=%SAVEPATH%"
call "%VS150COMNTOOLS%..\..\VC\Auxiliary\Build\vcvars32.bat"

msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Release
msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Release_ANGLE
msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Release_Shared

msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Debug
msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Debug_ANGLE
msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Debug_Shared

endlocal
popd
