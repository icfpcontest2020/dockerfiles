FROM mcr.microsoft.com/dotnet/core/sdk:3.1.300 AS publish
WORKDIR /source

COPY . .
WORKDIR /source/app
RUN dotnet publish -c release -o /build

FROM mcr.microsoft.com/dotnet/core/runtime:3.1.4
WORKDIR /build
COPY --from=publish /build .
ENTRYPOINT ["dotnet", "app.dll"]
