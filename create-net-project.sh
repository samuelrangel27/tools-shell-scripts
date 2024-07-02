#!/bin/bash
#param 1 project name
#param 2 sln name, if empty
#param 3 output dir 
echo "Creating solution"
sln=$1
if [! -z $2]; then
  $sln=$2
fi
projectname="netploy."$1".api"
projectpath="src/"$projectname
dotnet new sln --name $1
dotnet new webapi --name $projectname -o $projectpath
dotnet sln add $projectpath