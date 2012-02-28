#!/bin/bash

set -e
set -x

cd `dirname $0`
autoreconf -i
./configure CC=/home/ehsan/android-ndk-r5c/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86/bin/arm-eabi-gcc AR=/home/ehsan/android-ndk-r5c/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86/bin/arm-eabi-ar CPPFLAGS="-I/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/include/ -fPIC -ggdb" CFLAGS="-march=armv7-a -fPIC -ggdb -mthumb -mfpu=vfp -mfloat-abi=softfp -nostdlib" LDFLAGS="-Wl,-rpath-link=/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/lib/ -L/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/lib/" LIBS="-lc -lgcc" -host=arm-eabi --enable-debug
make -s
cp src/.libs/libunwind-arm.a ../libunwind.a
cp src/.libs/libunwind-ptrace.a ../libunwind-ptrace.a
