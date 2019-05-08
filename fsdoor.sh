#!/bin/bash

# author: artgerecht@github
# version: v.0.1
#
# description:
#   fsdoor.sh is a simple script to determine the door state of the Fachschaft Informatik
#   Create link to call script without path: 'ln ./fsdoor.sh /usr/local/bin/fsdoor'
#
# dependencies:
#   jq, (curl, sed)
#   jq is a lightweight and flexible command-line JSON processor
#

# define colors
RED="\033[31m"
GREEN="\033[32m"
NORMAL="\033[0;39m"


function checkDoor {
  # url to json
  url="https://fbihome.de/tuerstatus.php"

  # get json file via curl
  json_data="$(curl -s "$url")"

  # filter data from json
  dooropen="$(jq -n --argjson data "$json_data" '$data.D14 | .["2.10"].tuer')"

  # check doorstate
  if [ $dooropen == "true" ]; then
    echo -e "Fachschaft is "$GREEN"open" $NORMAL
  elif [ $dooropen == "false" ]; then
    echo -e "Fachschaft is "$RED"closed"
  fi
}


# check internet connectivity
case "$(curl -s --max-time 2 -I https://fbihome.de/tuerstatus.php | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')"
in
  [23]) checkDoor;;
  5) echo -e $RED "The web proxy won't let us through";;
  *) echo -e $RED "The network is down or very slow.";;
esac
