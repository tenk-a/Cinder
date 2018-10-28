pushd .

if "%VS141_DIR%"=="" call set_vs2017.bat

call "%VC141_DIR%\VC\Auxiliary\Build\vcvars64.bat"

msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Release
msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Release_ANGLE
msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Release_Shared

msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Debug
msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Debug_ANGLE
msbuild cinder.sln /t:Build /p:Platform=x64 /p:Configuration=Debug_Shared

call "%VC141_DIR%\VC\Auxiliary\Build\vcvars32.bat"

msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Release
msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Release_ANGLE
msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Release_Shared

msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Debug
msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Debug_ANGLE
msbuild cinder.sln /t:Build /p:Platform=Win32 /p:Configuration=Debug_Shared

popd
