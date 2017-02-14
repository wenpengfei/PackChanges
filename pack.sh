#!/bin/bash
function updateTimeSpan(){
if [ -n "$1" ] ;then
  echo "\033[32mstart updateTimeSpan... \033[0m"
    for arg in $*
    do
      echo '====='
      echo $arg
      echo '====='
    done
  echo 'updateTimeSpan complete'
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

