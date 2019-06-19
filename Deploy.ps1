$scriptPath = Split-Path -Parent $PSCommandPath
$deployPath = Join-Path -Path $scriptPath -ChildPath ".deploy"

Write-Host "Clearing deploy folder: $deployPath"
Remove-Item $deployPath -Recurse -Force

Write-Host "Testing PlatformSpecific"
dotnet test test/PlatformSpecific.Tests/PlatformSpecific.Tests.csproj -c Release

Write-Host "Testing PlatformSpecific MSTests"
dotnet test test/PlatformSpecific.MSTest.Tests/PlatformSpecific.MSTest.Tests.csproj -c Release

Write-Host "Deploying packages"
dotnet pack -o $deployPath