set VcVer=vc141
copy misc_lib\%VcVer%_Win32_static_release\libpng.lib       ..\..\..\lib\msw\x86\
copy misc_lib\%VcVer%_Win32_static_release\pixman-1.lib     ..\..\..\blocks\Cairo\lib\msw\x86\
copy misc_lib\%VcVer%_Win32_static_release\cairo-static.lib ..\..\..\blocks\Cairo\lib\msw\x86\
copy misc_lib\%VcVer%_x64_static_release\libpng.lib         ..\..\..\lib\msw\x64\
copy misc_lib\%VcVer%_x64_static_release\pixman-1.lib       ..\..\..\blocks\Cairo\lib\msw\x64\
copy misc_lib\%VcVer%_x64_static_release\cairo-static.lib   ..\..\..\blocks\Cairo\lib\msw\x64\
