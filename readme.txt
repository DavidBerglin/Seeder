To create and publish nuget package Seido.Utilities.SeedGenerator.x.y.z

1. Create nuget package and publish on localfeed
   With Terminal in folder .script run: ./create_nuget.sh x.y.z  (x.y.z is a version number e.i. 1.0.0)
   A nuget package is created in the localfeed (as per nuget.config)
   Nuget versions in all .csproj are updated to x.y.z 

2. With Terminal in folder AppUsage run: dotnet run
   Verify execution and usage of nuget package
   AppUsage is using localfeed as well as public feed

3. Create nuget package and publish on publc seidoNugets feed
   With Terminal in folder .script run: ./create_nuget.sh x.y.z  publish
   A nuget package is created in the localfeed and published to seidoNugets feed (as per nuget.config)
