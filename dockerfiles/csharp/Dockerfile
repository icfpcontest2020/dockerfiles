FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS publish
WORKDIR /source

COPY . .
WORKDIR /source/CSharpBot
RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/core/runtime:3.1
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "CSharpBot.dll"]
