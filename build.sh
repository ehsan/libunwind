#!/bin/bash

set -e
set -x

cd `dirname $0`
autoreconf -i
export CC=/home/ehsan/android-ndk-r5c/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86/bin/arm-eabi-gcc
export AR=/home/ehsan/android-ndk-r5c/toolchains/arm-eabi-4.4.0/prebuilt/linux-x86/bin/arm-eabi-ar
export CPPFLAGS="-I/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/include/ -fPIC -ggdb"
export CFLAGS="-march=armv7-a -fPIC -ggdb -mthumb -mfpu=vfp -mfloat-abi=softfp -nostdlib -funwind-tables"
export LDFLAGS="-Wl,-rpath-link=/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/lib/ -L/home/ehsan/android-ndk-r5c/platforms/android-5/arch-arm/usr/lib/"
export LIBS="-lc -lgcc"

./configure -host=arm-eabi --enable-debug
make -s
cp src/.libs/libunwind-arm.a ../libunwind.a
cp src/.libs/libunwind-ptrace.a ../libunwind-ptrace.a
