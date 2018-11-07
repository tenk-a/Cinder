set VcVer=vc141
pushd bld_lib_bat
call bld_zlib.bat   %VcVer%
call bld_libpng.bat %VcVer%
call bld_pixman.bat %VcVer%
call bld_cairo.bat  %VcVer%
popd
