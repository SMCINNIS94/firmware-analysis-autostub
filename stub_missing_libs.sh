#!/bin/bash

BINARY="./technbwin/bin/appman"
LIBDIR="technbwin/lib"
LOG="missing_so.txt"

while true; do
    LD_LIBRARY_PATH=$LIBDIR qemu-arm-static -L /usr/arm-linux-gnueabihf $BINARY 2>&1 | tee $LOG
    LIB=$(grep -oP 'lib\w+\.so(\.\d+)?' $LOG | head -n 1)
    if [ -z "$LIB" ]; then
        echo "✅ Done. No more missing .so files."
        break
    fi
    echo "⚠️ Missing: $LIB — stubbing..."

    SRC="dummy_$(basename $LIB .so).c"
    echo 'void dummy(){}' > $SRC
    arm-linux-gnueabihf-gcc -shared -o $LIBDIR/$LIB $SRC
done
