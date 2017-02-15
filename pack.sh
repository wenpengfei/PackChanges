#!/bin/bash
function updateTimeSpan(){
if [ -n "$1" ] ;then
  echo "\033[32mstart updateTimeSpan...\033[0m"
    for arg in $*
    do
      echo "processing: "$arg
      sed -i '' "s#${arg}#df#g" `grep * -rl /Users/catwen/Documents/github/PackChanges`
    done
  echo "\033[32mupdateTimeSpan complete.\033[0m"
  #git add . 
  #git commit -m 'update timespan(auto generate)'
else
  echo "\033[33mthis repo's js & css has nothing changed, pass updateTimeSpan\033[0m"
fi
}

function findChangedCSSAndScript(){
  updateTimeSpan $(git diff origin/Develop --name-only -- '*.js' '*.css')
}

function zipAllChanges(){
  echo "\033[32mstart zip...\033[0m"
  git diff origin/Develop --name-only | xargs zip `date '+%Y%m%d%H%M%S'.zip`
  echo "\033[32mdone!\033[0m"
}

findChangedCSSAndScript
zipAllChanges

