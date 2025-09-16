# TaskForge.Api/Dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["TaskForge.Api/TaskForge.Api.csproj", "TaskForge.Api/"]
COPY ["TaskForge.Application/TaskForge.Application.csproj", "TaskForge.Application/"]
COPY ["TaskForge.Infrastructure/TaskForge.Infrastructure.csproj", "TaskForge.Infrastructure/"]
COPY ["TaskForge.Core/TaskForge.Core.csproj", "TaskForge.Core/"]
RUN dotnet restore "TaskForge.Api/TaskForge.Api.csproj"
COPY . .
WORKDIR "/src/TaskForge.Api"
RUN dotnet publish "TaskForge.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "TaskForge.Api.dll"]
