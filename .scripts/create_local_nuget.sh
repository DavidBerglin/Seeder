#!/bin/bash
#To make the .sh file executable
#sudo chmod +x ./create_local_nuget.sh

# create local nuget directory, e.g.
# /Users/Martin/Development/nugets

# add the directory as a local nuget feed
# in /Users/Martin/.nuget/NuGet/NuGet.Config under <packageSources> add below line
#   <add key="localfeed" value="/Users/Martin/Development/nugets" />

#must give version as an argument
if [[ -z $1 ]]; then
    echo "Verson to publish must be provided, e.g. 1.0.1";
    exit 1;
fi

CSPROJ_FILE="../seedGenerator/seedGenerator.csproj"
NUGET_File="../seedGenerator/seedGenerator.$1.nupkg"

# Property to modify
VERSION="$1"

# Use sed to modify the property value
#https://sed.js.org/#
#https://stackoverflow.com/questions/45018156/using-sed-for-search-and-replace-multi-digits
#sed -i '.bak' -r 's/(<Version>)[0-9]+[.][0-9]+[.][0-9]+(<\/Version>)/\1replace\2/' ../seedGenerator/seedGenerator.csproj1
sed -i '.bak' -r "s/(<Version>)[0-9]+[.][0-9]+[.][0-9]+(<\/Version>)/\1$VERSION\2/" $CSPROJ_FILE

echo "Updated version to $VERSION in $CSPROJ_FILE"

#clear the local nuget cache
dotnet nuget locals all --clear

#build the nuget package project
dotnet build $CSPROJ_FILE

#create the nuget package
dotnet pack $CSPROJ_FILE -o ../seedGenerator

#publish the nuget package to local feed
dotnet nuget push $NUGET_File -s /Users/Martin/Development/seidoNugets