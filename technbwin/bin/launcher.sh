#!/bin/sh

export TECHNBWIN_DIR=/mnt/fw/technbwin
export MCU_UART=/dev/ttyS1

export LD_LIBRARY_PATH=$TECHNBWIN_DIR/lib:/media/flash/nvm/hdradio:$LD_LIBRARY_PATH
export PATH=$TECHNBWIN_DIR/bin:$PATH

# Kill existing processes
pgrep logcat | xargs -r kill
pgrep appman | xargs -r kill

# Start appman (main GUI launcher)
$TECHNBWIN_DIR/bin/appman --dfb:no-layers-clear

