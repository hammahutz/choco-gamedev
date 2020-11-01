choco upgrade all -y
dotnet new -i Monogame.Templates.CSharp
dotnet tool install -g dotnet-mgfxc
dotnet tool install -g dotnet-mgcb
dotnet tool install -g dotnet-mgcb-editor
mgcb-editor --register
