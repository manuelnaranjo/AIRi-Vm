#!/bin/sh

for i in $( ls /sys/class/bluetooth/ ); do
    hciconfig $i up
done
