#!/bin/sh

COLOR=blue

function turn_on {
  echo on
  echo 255 > /sys2/class/leds/cubieboard2\:${COLOR}\:usr/brightness
}

function turn_off {
  echo off
  echo 0 > /sys2/class/leds/cubieboard2\:${COLOR}\:usr/brightness
}

trap 'echo exit; turn_off; exit' 15

while true; do
  turn_on
  sleep 0.5
  turn_off
  sleep 0.5
done
