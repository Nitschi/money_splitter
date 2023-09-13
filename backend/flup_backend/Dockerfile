FROM mcr.microsoft.com/dotnet/sdk:7.0

RUN dotnet new tool-manifest --name tools
RUN dotnet tool install --global dotnet-ef
ENV PATH="${PATH}:/root/.dotnet/tools"


COPY . /backend
WORKDIR /backend
RUN dotnet ef migrations add InitialCreate
RUN dotnet ef database update

ENTRYPOINT cd /backend && dotnet run