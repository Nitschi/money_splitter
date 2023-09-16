FROM mcr.microsoft.com/dotnet/sdk:7.0

RUN dotnet new tool-manifest --name tools
RUN dotnet tool install --global dotnet-ef
ENV PATH="${PATH}:/root/.dotnet/tools"


COPY ./backend /backend
WORKDIR /backend/flup_backend
RUN cd /backend/flup_backend
RUN dotnet ef database update

ENTRYPOINT cd /backend/flup_backend && dotnet run