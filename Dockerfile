FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base

WORKDIR /app
EXPOSE 5000/tcp
EXPOSE 1212

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS publish
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY . .
RUN dotnet restore "SS14.Watchdog/SS14.Watchdog.csproj"
RUN dotnet publish -c Release -r linux-x64 --no-self-contained --no-restore -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT [ "dotnet", "SS14.Watchdog.dll" ]

