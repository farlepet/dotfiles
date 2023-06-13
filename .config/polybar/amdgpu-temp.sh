#!/bin/sh

HWMON=/sys/class/drm/card0/device/hwmon/hwmon0

temp=$(cat $HWMON/temp2_input | sed 's/...$//')

power=$(cat $HWMON/power1_average | sed 's/......$//')

freq=$(cat $HWMON/freq1_input | sed 's/......$//')


echo ${temp}°C ${power}W ${freq}MHz

#echo "FIXME"

# sensors amdgpu-pci-0f00 | grep junction | awk '{ print substr($2, 2); }'
