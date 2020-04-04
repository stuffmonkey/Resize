#!/bin/bash
function start()
{
  echo Indtast program efterfulgt af placering [1-4]:
  read Program Place
  echo $Place
  P="Chrome"
  if [[ "$Program" == "$P" || "$Program" == "chrome"  ]]; then
    A="Google Chrome"
  else
    A="$Program"
  fi

  if [[ "$Place" == "1" ]]; then
    xPos=0
    yPos=0
  elif [[ "$Place" == "2" ]]; then
    xPos=1277
    yPos=0
  elif [[ "$Place" == "3" ]]; then
    xPos=0
    yPos=685
  elif [[ "$Place" == "4" ]]; then
    xPos=1277
    yPos=685
  else
    echo Placering ikke genkendt, prøv igen
    sleep 0.2
    start
  fi
}
start

osascript -e "
set appHeight to 662
set appWidth to 1277

tell application \"$A\"
	activate
	reopen
	set yAxis to \"$yPos\" as integer
	set xAxis to \"$xPos\" as integer
	set the bounds of the first window to {xAxis, yAxis, appWidth + xAxis, appHeight + yAxis}
end tell
tell application \"Terminal\"
  activate
  reopen
end tell"
