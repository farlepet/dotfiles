#!/bin/sh

temp=$(cat /sys/class/drm/card0/device/hwmon/hwmon1/temp2_input | sed 's/...$//')

power=$(cat /sys/class/drm/card0/device/hwmon/hwmon1/power1_average | sed 's/......$//')

freq=$(cat /sys/class/drm/card0/device/hwmon/hwmon1/freq1_input | sed 's/......$//')


echo ${temp}°C ${power}W ${freq}MHz

#echo "FIXME"

# sensors amdgpu-pci-0f00 | grep junction | awk '{ print substr($2, 2); }'
