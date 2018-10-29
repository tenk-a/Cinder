rem @echo off
if "%VS150COMNTOOLS%"=="" call set_vs2017.bat

setlocal

pushd ..\..\samples

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
call :conv1 _audio\BufferPlayer\vc2017 BufferPlayer.sln
call :conv1 _audio\DelayFeedback\vc2017 DelayFeedback.sln
call :conv1 _audio\InputAnalyzer\vc2017 InputAnalyzer.sln
call :conv1 _audio\MultichannelOutput\vc2017 MultichannelOutput.sln
call :conv1 _audio\NodeAdvanced\vc2017 NodeAdvanced.sln
call :conv1 _audio\NodeBasic\vc2017 NodeBasic.sln
call :conv1 _audio\NodeSubclassing\vc2017 NodeSubclassing.sln
call :conv1 _audio\VoiceBasic\vc2017 VoiceBasic.sln
call :conv1 _audio\VoiceBasicProcessing\vc2017 VoiceBasicProcessing.sln
call :conv1 _opengl\ClothSimulation\vc2017 ClothSimulation.sln
call :conv1 _opengl\Cube\vc2017 Cube.sln
call :conv1 _opengl\CubeMapping\vc2017 CubeMapping.sln
call :conv1 _opengl\DeferredShading\vc2017 DeferredShading.sln
call :conv1 _opengl\DeferredShadingAdvanced\vc2017 DeferredShadingAdvanced.sln
call :conv1 _opengl\DynamicCubeMapping\vc2017 DynamicCubeMapping.sln
call :conv1 _opengl\FboBasic\vc2017 FboBasic.sln
call :conv1 _opengl\FboMultipleRenderTargets\vc2017 FboMultipleRenderTargets.sln
call :conv1 _opengl\GeometryShaderBasic\vc2017 GeometryShaderBasic.sln
call :conv1 _opengl\HighDynamicRange\vc2017 HighDynamicRange.sln
call :conv1 _opengl\ImmediateMode\vc2017 ImmediateMode.sln
call :conv1 _opengl\InstancedTeapots\vc2017 InstancedTeapots.sln
call :conv1 _opengl\LevelOfDetailBasic\vc2017 LevelOfDetailBasic.sln
call :conv1 _opengl\LevelOfDetailIndirect\vc2017 LevelOfDetailIndirect.sln
call :conv1 _opengl\MipMap\vc2017 MipMap.sln
call :conv1 _opengl\MotionBlurFbo\vc2017 MotionBlurFbo.sln
call :conv1 _opengl\MotionBlurVelocityBuffer\vc2017 MotionBlurVelocityBuffer.sln
call :conv1 _opengl\NVidiaComputeParticles\vc2017 NVidiaComputeParticles.sln
call :conv1 _opengl\NormalMapping\vc2017 NormalMapping.sln
call :conv1 _opengl\NormalMappingBasic\vc2017 NormalMappingBasic.sln
call :conv1 _opengl\ObjLoader\vc2017 ObjLoader.sln
call :conv1 _opengl\PBOReadBack\vc2017 PBOReadBack.sln
call :conv1 _opengl\ParticleSphereCPU\vc2017 ParticleSphereCPU.sln
call :conv1 _opengl\ParticleSphereCS\vc2017 ParticleSphereCS.sln
call :conv1 _opengl\ParticleSphereGPU\vc2017 ParticleSphereGPU.sln
call :conv1 _opengl\ParticlesBasic\vc2017 ParticlesBasic.sln
call :conv1 _opengl\PickingFBO\vc2017 PickingFBO.sln
call :conv1 _opengl\PostProcessingAA\vc2017 PostProcessingAA.sln
call :conv1 _opengl\ShadowMapping\vc2017 ShadowMapping.sln
call :conv1 _opengl\ShadowMappingBasic\vc2017 ShadowMappingBasic.sln
call :conv1 _opengl\StencilReflection\vc2017 StencilReflection.sln
call :conv1 _opengl\SuperformulaGPU\vc2017 SuperformulaGPU.sln
call :conv1 _opengl\TessellationBasic\vc2017 TessellationBasic.sln
call :conv1 _opengl\TessellationBezier\vc2017 TessellationBezier.sln
call :conv1 _opengl\TransformFeedbackSmokeParticles\vc2017 TransformFeedbackSmokeParticles.sln
call :conv1 _opengl\VboMesh\vc2017 VboMesh.sln
call :conv1 _svg\AnimatedReveal\vc2017 AnimatedReveal.sln
call :conv1 _svg\EuroMap\vc2017 EuroMap.sln
call :conv1 _svg\GoodNightMorning\vc2017 GoodNightMorning.sln
call :conv1 _svg\SimpleViewer\vc2017 SimpleViewer.sln
call :conv1 _timeline\BasicAppendTween\vc2017 BasicAppendTween.sln
call :conv1 _timeline\BasicTween\vc2017 BasicTween.sln
call :conv1 _timeline\CustomCallback\vc2017 CustomCallback.sln
call :conv1 _timeline\CustomLerp\vc2017 CustomLerp.sln
call :conv1 _timeline\DragTween\vc2017 DragTween.sln
call :conv1 _timeline\ImageAccordion\vc2017 ImageAccordion.sln
call :conv1 _timeline\PaletteBrowser\vc2017 PaletteBrowser.sln
call :conv1 _timeline\TextInputTween\vc2017 TextInputTween.sln
call :conv1 _timeline\VisualDictionary\vc2017 VisualDictionary.sln
call :conv1 ArcballDemo\vc2017 ArcballDemo.sln
call :conv1 BSpline\vc2017 BSpline.sln
call :conv1 BasicApp\vc2017 BasicApp.sln
call :conv1 BasicAppMultiWindow\vc2017 BasicAppMultiWindow.sln
call :conv1 BezierPath\vc2017 BezierPath.sln
call :conv1 BezierPathIteration\vc2017 BezierPathIteration.sln
call :conv1 CairoBasic\vc2017 CairoBasic.sln
call :conv1 CameraPersp\vc2017 CameraPersp.sln
call :conv1 CaptureBasic\vc2017 CaptureBasic.sln
call :conv1 CaptureCube\vc2017 CaptureCube.sln
call :conv1 ClipboardBasic\vc2017 ClipboardBasic.sln
call :conv1 Earthquake\vc2017 Earthquake.sln
call :conv1 EaseGallery\vc2017 EaseGallery.sln
call :conv1 Extrude\vc2017 Extrude.sln
call :conv1 FallingGears\vc2017 FallingGears.sln
call :conv1 FlickrTestMultithreaded\vc2017 FlickrTestMultithreaded.sln
call :conv1 FontSample\vc2017 FontSample.sln
call :conv1 FrustumCulling\vc2017 FrustumCulling.sln
call :conv1 Geometry\vc2017 Geometry.sln
call :conv1 HighDensityDisplay\vc2017 HighDensityDisplay.sln
call :conv1 ImageFileBasic\vc2017 ImageFileBasic.sln
call :conv1 ImageHeightField\vc2017 ImageHeightField.sln
call :conv1 Logging\vc2017 Logging.sln
call :conv1 MandelbrotGLSL\vc2017 MandelbrotGLSL.sln
call :conv1 MultiTouchBasic\vc2017 MultiTouchBasic.sln
call :conv1 ParamsBasic\vc2017 ParamsBasic.sln
call :conv1 perlinTest\vc2017 perlinTest.sln
call :conv1 Picking3D\vc2017 Picking3D.sln
call :conv1 QuaternionAccum\vc2017 QuaternionAccum.sln
call :conv1 RDiffusion\vc2017 RDiffusion.sln
call :conv1 Renderer2dBasic\vc2017 Renderer2d.sln
call :conv1 SaveImage\vc2017 SaveImage.sln
call :conv1 SerialCommunication\vc2017 SerialCommunication.sln
call :conv1 slerpBasic\vc2017 slerpBasic.sln
call :conv1 StereoscopicRendering\vc2017 StereoscopicRendering.sln
call :conv1 SurfaceBasic\vc2017 SurfaceBasic.sln
call :conv1 TextBox\vc2017 TextBox.sln
call :conv1 TextTest\vc2017 TextTest.sln
call :conv1 TextureFont\vc2017 TextureFont.sln
call :conv1 Triangulation\vc2017 Triangulation.sln
call :conv1 Tubular\vc2017 Tubular.sln
call :conv1 VoronoiGpu\vc2017 VoronoiGpu.sln
call :conv1 Wisteria\vc2017 Wisteria.sln
call :conv1 QuickTimeAdvanced\vc2017 QTimeAdvApp.sln	Win32Only
call :conv1 QuickTimeBasic\vc2017 QuickTimeBasic.sln	Win32Only
call :conv1 QuickTimeIteration\vc2017 QuickTimeIteration.sln	Win32Only
call :conv1 Kaleidoscope\vc2017 Instascope.sln
rem call :conv1 _AllSamples\vc2017 AllSamples.sln
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
