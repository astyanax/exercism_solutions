#!/usr/bin/env bash

actions=""
if (("$1" &  1)); then actions+="wink,"; fi
if (("$1" &  2)); then actions+="double blink,"; fi
if (("$1" &  4)); then actions+="close your eyes,"; fi
if (("$1" &  8)); then actions+="jump,"; fi
if (("$1" & 16)); then actions=$(echo "$actions" | tac -s ','); fi
actions="${actions%,}"
echo ${actions}