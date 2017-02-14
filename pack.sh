#!/bin/bash
function updateTimeSpan(){
	echo 'start updateTimeSpan...'
	  for arg in $*
		do
		  echo '====='
		  echo $arg
		  echo '====='
	  done
	echo 'updateTimeSpan complete' 
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

