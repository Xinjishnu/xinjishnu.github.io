#!/bin/bash

# Name: nvidiadrv_check
# Author: Michael Orr
# Purpose: To check for update Nvidia driver and then notify user via osd-notify
# Date Created: 201612122
# License: GPL
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as 
# published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERC# HANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/# Revision history: 

# Variables

nvidia_drv_new=$(curl -L ftp://download.nvidia.com/XFree86/Linux-x86_64/latest.txt | cut -c 1-6)
#echo $nvidia_drv_new 

#nvidia_drv_current=$375.01
nvidia_drv_current=$(modinfo nvidia |grep version | sed '2d' |cut -c 17-22)
#echo $nvidia_drv_current 

if echo $nvidia_drv_new $nvidia_drv_current | awk '{exit $1>$2?0:1}'  
then
   notify-send  -i /usr/share/pixmaps/Nvidia-1.png "NVIDIA graphics driver version $nvidia_drv_new available for download."

else 

   exit 0
fi
