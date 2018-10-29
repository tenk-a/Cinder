@echo off
if not "%VS150COMNTOOLS%"=="" goto :EOF

if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\VsMSBuildCmd.bat"   goto Enterprise
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Professional\Common7\Tools\VsMSBuildCmd.bat" goto Professional
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"    goto Community

echo ERROR: Not found "Microsoft Visual Studio 2017"
goto :EOF

:Enterprise
call "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\VsMSBuildCmd.bat"
goto :EOF

:Professional
call "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Professional\Common7\Tools\VsMSBuildCmd.bat"
goto :EOF

:Community
call "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"
goto :EOF
