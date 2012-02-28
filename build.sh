#!/bin/bash

set -e

cd `dirname $0`
autoreconf -i
./configure CC=/home/ehsan/android-ndk-r5c/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86/bin/arm-eabi-gcc CPPFLAGS="-I/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/include/ -fPIC -ggdb" CFLAGS="-march=armv7-a -fPIC -ggdb -mthumb -mfpu=vfp -mfloat-abi=softfp -nostdlib" LDFLAGS="-Wl,-rpath-link=/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/lib/ -L/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/lib/" LIBS="-lc -lgcc" -host=arm-eabi --enable-debug
make
./configure CC=/home/ehsan/android-ndk-r5c/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86/bin/arm-eabi-gcc CPPFLAGS="-I/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/include/ -fPIC -ggdb" CFLAGS="-march=armv7-a -fPIC -ggdb -mthumb -mfpu=vfp -mfloat-abi=softfp -nostdlib" LDFLAGS="-Wl,-rpath-link=/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/lib/ -L/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/lib/" LIBS="-lc -lgcc" -host=arm-eabi --enable-debug --enable-ptrace-only
make
cp src/.libs/libunwind-arm.a ../libunwind.a
cp src/.libs/libunwing-ptrace.a ../libunwind-ptrace.a
