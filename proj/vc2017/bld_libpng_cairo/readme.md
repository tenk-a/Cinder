Build libpng.lib, pixman-1.lib, cairo-static.lib for vc2017(vc14.1).

1. Pass through the path so that you can use git.

2. Install mozilla-build, c:\mozilla-build is possible.

2. Run download.bat to obtain the library source and build batch.

4. In bld_lib_bat / libs_config.bat  
     set CcMingw32Make=c:\mozilla-build\bin\mozmake.exe  
     set CcMsys1Paths=C:\mozilla-build\msys\local\bin;C:\mozilla-build\msys\bin  
     
   Adjust to your environment. Required for building pixman, cairo.  

5. Run build.bat.

6. Run copy_to.bat.
