# TaskForge

Enterprise-grade Task Management SaaS (MVP) — .NET 8, EF Core, React + TypeScript, SignalR, Multi-tenant.

## Run locally
1. Backend
   - `dotnet ef database update -p TaskForge.Infrastructure -s TaskForge.Api`
   - `dotnet run --project TaskForge.Api`
2. Frontend
   - `cd frontend`
   - `npm install`
   - `npm run dev`

## Architecture
- Core, Application, Infrastructure, Api layers (Clean Architecture)
- SQL Server, EF Core
- JWT Auth + Refresh Tokens
- SignalR for realtime
