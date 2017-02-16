#!/bin/bash
function updateTimeSpan(){
if [ -n "$1" ] ;then
  echo -e "\033[32mstart updateTimeSpan...\033[0m"
    for arg in $*
    do
      echo "processing: "$arg
      #sed -i "s#${arg}#df#g" `grep * -rl /Users/catwen/Documents/github/PackChanges`
      #sed -i '' "s#${arg}#xxx#g" `grep test/a.js -rl /Users/catwen/Documents/github/PackChanges`
      #sed -i '' "s#${arg}#xxx#g" test/index.aspx
      sed -i '' "s#${arg}?v=#${arg}?v=0#g" `grep $arg -rl *`
    done
  echo -e "\033[32mupdateTimeSpan complete.\033[0m"
  #git add . 
  #git commit -m 'update timespan(auto generate)'
else
  echo -e "\033[33mthis repo's js & css has nothing changed, pass updateTimeSpan\033[0m"
fi
}

function findChangedCSSAndScript(){
  updateTimeSpan $(git diff master develop --name-only -- '*.js' '*.css')
}

function zipAllChanges(){
  echo -e "\033[32mstart zip...\033[0m"
  #git diff master origin/Develop --name-only | xargs zip `date '+%Y%m%d%H%M%S'.zip`
  echo -e "\033[32msuccess!\033[0m"
}

findChangedCSSAndScript
zipAllChanges

