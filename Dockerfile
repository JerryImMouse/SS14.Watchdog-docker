FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base

WORKDIR /app

# watchdog host port
EXPOSE 8080/tcp

# game server and status
EXPOSE 1212

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS publish
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY . .
WORKDIR /src/SS14.Watchdog
RUN dotnet publish "SS14.Watchdog.csproj" -c Release -r linux-x64 --no-self-contained -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT [ "dotnet", "SS14.Watchdog.dll" ]

