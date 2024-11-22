# https://github.com/gpac/gpac/wiki/GPAC-build-MP4Box-only-all-platforms
apt install mingw-w64 gcc g++ make git automake zlib1g-dev freeglut3 freeglut3-dev build-essential fakeroot dpkg-dev devscripts ccache debhelper pkg-config mesa-utils lcov libfreetype6-dev libjpeg62-dev libpng-dev libmad0-dev libfaad-dev libogg-dev libvorbis-dev libtheora-dev liba52-0.7.4-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavdevice-dev libxv-dev x11proto-video-dev libgl1-mesa-dev x11proto-gl-dev libxvidcore-dev libssl-dev libjack-dev libasound2-dev libpulse-dev libsdl2-dev dvb-apps 
git clone https://github.com/gpac/gpac.git --depth=1 
cd gpac
ln -sf /usr/x86_64-w64-mingw32 x86_64-w64-mingw32
./configure clean
make clean
./configure --static-mp4box --use-zlib=no
make -j4
./configure clean
make clean
./configure --target-os=mingw32 --cross-prefix=x86_64-w64-mingw32- --prefix=build/x86_64-w64-mingw32 --static-mp4box --use-zlib=no --extra-cflags="-Ibuild/x86_64-w64-mingw32/include" --extra-ldflags="-Lbuild/x86_64-w64-mingw32/lib"
make -j4
