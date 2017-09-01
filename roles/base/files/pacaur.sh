#!/bin/bash
if pacman -Q pacaur &> /dev/null; then PACAUR="true"; else PACAUR="false"; fi
if pacman -Q cower &> /dev/null; then COWER="true"; else COWER="false"; fi
echo {"PACAUR" : "$PACAUR"}
echo {"COWER" : "$COWER"}
