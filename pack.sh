#!/bin/bash
function updateTimeSpan(){
if [ -n "$1" ] ;then
  echo "\033[32m start updateTimeSpan... \033[0m"
    for arg in $*
    do
      echo $arg
    done
  echo "\033[32m updateTimeSpan complete. \033[0m"
  git add . 
  git commit -m 'update timespan(auto generate)'
else
  echo "\033[33m this repo's js & css has nothing changed, pass updateTimeSpan \033[0m"
fi
}

function findChangedCSSAndScript(){
  updateTimeSpan $(git diff origin/Develop --name-only -- '*.js' '*.css')
}

function zipAllChanges(){
  echo 'start zip...'
  echo 'done' 
}

findChangedCSSAndScript
zipAllChanges

