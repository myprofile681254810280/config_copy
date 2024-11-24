#!/bin/bash

########################
#udisksctl mount -b /dev/disk/by-label/dmzj -o dmask=077,fmask=177
#udisksctl mount -b /dev/disk/by-label/4T   -o dmask=077,fmask=177

udisksctl mount -b /dev/disk/by-label/dmzj
#udisksctl mount -b /dev/disk/by-label/usb1
#udisksctl mount -b /dev/disk/by-label/usb2

udisksctl mount -b /dev/disk/by-label/4T
