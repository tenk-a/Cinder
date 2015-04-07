/*
 Copyright (c) 2015, The Cinder Project

 This code is intended to be used with the Cinder C++ library, http://libcinder.org

 Redistribution and use in source and binary forms, with or without modification, are permitted provided that
 the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this list of conditions and
	the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and
	the following disclaimer in the documentation and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
 WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 */

#include "cinder/app/android/AppAndroid.h"
#include "cinder/app/android/AppImplAndroid.h"

#include "cinder/android/AndroidDevLog.h"
using namespace ci::android;

namespace cinder { namespace app {

AppAndroid::AppAndroid()
	: AppBase()
{
dbg_app_fn_enter( __PRETTY_FUNCTION__ );

	const Settings *settings = dynamic_cast<Settings *>( sSettingsFromMain );
	CI_ASSERT( settings );

	enablePowerManagement( settings->isPowerManagementEnabled() ); // TODO: consider moving to common method

	Platform::get()->setExecutablePath( getAppPath() );

	mImpl.reset( new AppImplAndroid( this, *settings ) );	

dbg_app_fn_exit( __PRETTY_FUNCTION__ );
}

AppAndroid::~AppAndroid()
{
dbg_app_fn_enter( __PRETTY_FUNCTION__ );
dbg_app_fn_exit( __PRETTY_FUNCTION__ );
}

void AppAndroid::initialize( Settings *settings, const RendererRef &defaultRenderer, const char *title )
{
	AppBase::initialize( settings, defaultRenderer, title, 0, nullptr );
}

void AppAndroid::launch( const char *title, int argc, char * const argv[] )
{
dbg_app_fn_enter( __PRETTY_FUNCTION__ );

	mImpl->setup();

	//
	// NOTE: Don't call AppImplAndroid's event loop functions from here.
	//
	
dbg_app_fn_exit( __PRETTY_FUNCTION__ );
}

WindowRef AppAndroid::createWindow( const Window::Format &format )
{
	return mImpl->createWindow( format );
}

void AppAndroid::quit()
{
	mImpl->quit();
}

float AppAndroid::getFrameRate() const
{
	return mImpl->getFrameRate();
}

void AppAndroid::setFrameRate( float frameRate )
{
	mImpl->setFrameRate( frameRate );
}

void AppAndroid::disableFrameRate()
{
	mImpl->disableFrameRate();
}

bool AppAndroid::isFrameRateEnabled() const
{
	return mImpl->isFrameRateEnabled();
}

fs::path AppAndroid::getAppPath() const
{
	return AppImplAndroid::getAppPath();
}

WindowRef AppAndroid::getWindow() const
{
	return mImpl->getWindow();
}

WindowRef AppAndroid::getWindowIndex( size_t index ) const
{
	return mImpl->getWindowIndex( index );
}

size_t AppAndroid::getNumWindows() const
{
	return mImpl->getNumWindows();
}

WindowRef AppAndroid::getForegroundWindow() const
{
	return mImpl->getForegroundWindow();
}

void AppAndroid::hideCursor()
{
	mImpl->hideCursor();
}

void AppAndroid::showCursor()
{
	mImpl->showCursor();
}

ivec2 AppAndroid::getMousePos() const
{
	return mImpl->getMousePos();
}

} } // namespace cinder::app
