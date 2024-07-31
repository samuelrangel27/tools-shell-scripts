#!/bin/bash

# Initialize variables with default values
project=""
solution=""

# Set options for the getopt command
options=$(getopt -o "p:s:" -l "project:,solution:" "$@")
if [ $? -ne 0 ]; then
    echo "Invalid arguments."
    exit 1
fi
echo $options
eval set -- "$options"

# Read the named argument values
while [ $# -gt 0 ]; do
    echo {$1} {$2}
    case "$1" in
        -p | --project ) project=$2; shift;;
        -s | --solution ) solution=$2; shift;;
        -- ) shift;;
    esac
    shift
done
echo $project
echo $solution
#param 1 project name
#param 2 sln name, if empty
#param 3 output dir 

echo "Creating solution"
sln=$project
if [! -z $solution]; then
  $sln=$solution
fi
projectname="netploy."$project".api"
projectpath="src/"$projectname
dotnet new sln --name $sln
dotnet new webapi --name $projectname -o $projectpath
dotnet sln add $projectpath