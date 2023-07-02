FROM mcr.microsoft.com/dotnet/sdk:7.0

# Install tmux
COPY backend /backend

ENTRYPOINT cd /backend && dotnet run