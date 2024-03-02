#!/bin/bash
cd "$(dirname "$0")"
if ! groups $USER | grep -q "docker"; then
  echo Adding you do group docker
  {
    sudo usermod -aG docker $USER  && echo Done!
  } || { 
    echo Failed!
    echo Please exit the program or use CTRL+C or type 0
    echo If this is a false alarm ignore this message.
  }
fi
make rootfs