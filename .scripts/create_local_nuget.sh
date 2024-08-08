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

CSPROJ_FILE="../seedGenerator/seedGenerator.csproj1"
NUGET_File="../seedGenerator/seedGenerator.$1.nupkg"

# Property to modify
PROPERTY_NAME="Version"
NEW_VALUE="$1"

# Use sed to modify the property value
sed -i '' -E 's/<Version>\*\<\/Version>/<Versions>/' "$CSPROJ_FILE"

#sed -i '' -E "s/(<$PROPERTY_NAME>)*(</$PROPERTY_NAME>)/\1$NEW_VALUE\2/" "$CSPROJ_FILE"
echo "Updated $PROPERTY_NAME to $NEW_VALUE in $CSPROJ_FILE"


exit 1

#clear the local nuget cache
dotnet nuget locals all --clear

#build the nuget package project
dotnet build $CSPROJ_FILE

#create the nuget package
dotnet pack $CSPROJ_FILE -o ../seedGenerator

#publish the nuget package to local feed
dotnet nuget push $NUGET_File -s /Users/Martin/Development/seidoNugets