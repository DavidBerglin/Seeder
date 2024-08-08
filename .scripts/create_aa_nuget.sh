#!/bin/bash
#To make the .sh file executable
#sudo chmod +x ./create_local_nuget.sh

# create local nuget directory, e.g.
# /Users/Martin/Development/nugets

# add the directory as a local nuget feed
# in /Users/Martin/.nuget/NuGet/NuGet.Config under <packageSources> add below line
#   <add key="localfeed" value="/Users/Martin/Development/nugets" />

if [[ -z $1 ]]; then
    echo "Verson to publish must be provided, e.g. 1.0.1";
    exit 1;
fi

NUGET_File="../seedGenerator/seedGenerator.$1.nupkg";

#clear the local nuget cache
dotnet nuget locals all --clear

#build the nuget package project
dotnet build ../seedGenerator/seedGenerator.csproj

#create the nuget package
dotnet pack ../seedGenerator/seedGenerator.csproj -o ../seedGenerator

#publish the nuget package to seidoNugets feed
dotnet nuget push --source "seidoNugets"  --api-key az $NUGET_File
