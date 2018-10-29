rem @echo off
if "%VS150COMNTOOLS%"=="" call set_vs2017.bat

setlocal

pushd ..\..\test

call "%VS150COMNTOOLS%..\..\VC\Auxiliary\Build\vcvars64.bat"
call :cmpls x64 Release
call :cmpls x64 Debug

call "%VS150COMNTOOLS%..\..\VC\Auxiliary\Build\vcvars32.bat"
call :cmpls Win32 Release
call :cmpls Win32 Debug

popd

goto :END


:cmpls
set PLATFORM=%1
set CONFIGURATION=%2

call :conv1 _audio\DeviceTest\vc2017 DeviceTest.sln
call :conv1 _audio\NodeEffectsTest\vc2017 NodeEffectsTest.sln
call :conv1 _audio\NodeTest\vc2017 NodeTest.sln
call :conv1 _audio\ParamTest\vc2017 ParamTest.sln
call :conv1 _audio\SampleTest\vc2017 SampleTest.sln
call :conv1 _audio\SpectralTest\vc2017 SpectralTest.sln
call :conv1 _audio\StressTest\vc2017 StressTest.sln
call :conv1 _audio\VoiceTest\vc2017 VoiceTest.sln
call :conv1 _audio\WaveTableTest\vc2017 WaveTableTest.sln
call :conv1 _opengl\BufferTexture\vc2017 BufferTexture.sln
call :conv1 _opengl\CompressedTexture\vc2017 CompressedTexture.sln
call :conv1 _opengl\ConvenienceDrawingMethods\vc2017 ConvenienceDrawingMethods.sln
call :conv1 _opengl\CubeMapLayout\vc2017 CubeMapLayout.sln
call :conv1 _opengl\GlslProgAttribTest\vc2017 GlslProgAttribTest.sln
call :conv1 _opengl\ImageSourcePbo\vc2017 ImageSourcePbo.sln
call :conv1 _opengl\IntegerAttribTest\vc2017 IntegerAttribTest.sln
call :conv1 _opengl\ObjectTracking\vc2017 ObjectTracking.sln
call :conv1 _opengl\PboUploadTest\vc2017 PboUploadTest.sln
call :conv1 _opengl\QueryTest\vc2017 QueryTest.sln
call :conv1 _opengl\SamplerObject\proj\vc2017 SamplerObject.sln
call :conv1 _opengl\ShaderPreprocessorTest\vc2017 ShaderPreprocessorTest.sln
call :conv1 _opengl\Texture1d\vc2017 Texture1d.sln
call :conv1 _opengl\Texture3d\vc2017 Texture3d.sln
call :conv1 _opengl\TextureUpload\vc2017 TextureUpload.sln
call :conv1 _opengl\TransformFeedbackIntro\vc2017 TransformFeedbackSingleObject.sln
call :conv1 _opengl\usampler2D\vc2017 usampler2D.sln
call :conv1 AABBtest\vc2017 AABBtest.sln
call :conv1 AppTest\vc2017 AppTest.sln
call :conv1 ArcballTest\vc2017 ArcballTest.sln
call :conv1 assetTest\vc2017 assetTest.sln
call :conv1 base64Test\vc2017 base64Test.sln
call :conv1 CameraLensShiftTest\vc2017 CameraLensShiftTest.sln
call :conv1 CaptureTest\vc2017 CaptureTest.sln
call :conv1 CinderDLL\proj\vc2017 CinderDLL.sln
call :conv1 DebugTest\vc2017 DebugTest.sln
call :conv1 cmdLineArgs\vc2017 cmdLineArgs.sln
call :conv1 DisplayTest\vc2017 DisplayTest.sln
call :conv1 eventTest\vc2017 eventTest.sln
call :conv1 ExtrudeSpline\vc2017 ExtrudeSpline.sln
call :conv1 FloatCamera\vc2017 FloatCamera.sln
call :conv1 GeomSourceMods\vc2017 GeomSourceMods.sln
call :conv1 imageProcessing\vc2017 imageProcessing.sln
call :conv1 LineBreakTest\vc2017 LineBreakTest.sln
call :conv1 resizeTest\vc2017 resizeTest.sln
call :conv1 ScreenSaverTest\vc2017 TestScreensaver.sln
call :conv1 ShapeTest\vc2017 ShapeTest.sln
call :conv1 SphereProjection\vc2017 SphereProjection.sln
call :conv1 StackBlurTest\vc2017 StackBlurTest.sln
call :conv1 streamFileTest\vc2017 streamFileTest.sln
call :conv1 SystemTest\vc2017 SystemTest.sln
call :conv1 TriMeshReadWriteTest\vc2017 TriMeshReadWriteTest.sln
call :conv1 unit\vc2017 unit.sln
call :conv1 windowTest\vc2017 windowTest.sln
call :conv1 WindowToWorldTest\vc2017 WindowToWorldTest.sln
call :conv1 XMLTest\vc2017 XMLTest.sln
rem call :conv1 _audio\AudioTest.msw AudioTest.sln
rem call :conv1 cairoTest\vc2017 cairoTest.sln
rem call :conv1 mathTest\vc2017 mathTest.sln
rem call :conv1 SignalsTest\vc2017 SignalsTest.sln

exit /b

:conv1
set TGTDIR=%1
set TGTSLN=%2

if not "%3"=="Win32Only" goto SKIP1
if "%PLATFORM%"=="Win32" goto SKIP1
exit /b
:SKIP1

pushd %TGTDIR%
msbuild %TGTSLN% /t:Build /p:Platform=%PLATFORM% /p:Configuration=%CONFIGURATION%
popd

exit /b


:END
echo END
endlocal
