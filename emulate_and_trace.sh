#!/bin/bash

setsid qemu-system-arm \
  -M virt \
  -cpu cortex-a15 \
  -kernel openwrt-22.03.5-armvirt-32-zImage \
  -initrd openwrt-22.03.5-armvirt-32-rootfs.cpio \
  -nographic \
  -append "root=/dev/ram rw console=ttyAMA0" \
  -fsdev local,id=host0,path=$(pwd),security_model=none \
  -device virtio-9p-device,fsdev=host0,mount_tag=hostshare \
  -netdev user,id=net0 \
  -device virtio-net-device,netdev=net0 \
  </dev/null &>run.log &

echo "QEMU started in the background. Console output is in run.log"

