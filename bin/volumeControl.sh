#!/usr/bin/bash

getdefaultsinkname() {
    pacmd stat | awk -F": " '/^Default sink name: /{print $2}'
}

getdefaultsinkvol() {
    pacmd list-sinks |
        awk '/^\s+name: /{indefault = $2 == "<'$(getdefaultsinkname)'>"}
            /^\s+volume: / && indefault {print $5; exit}' |
        awk -F"%" '{print $1}'
}

setdefaultsinkvol() {
    pactl -- set-sink-volume $(getdefaultsinkname) $1
}

case $1 in

  "set")
    setdefaultsinkvol $1
  ;;

  "get")
    getdefaultsinkvol
  ;;

  *)
    echo "unknown command $1"
    return 1
  ;;  

esac  
