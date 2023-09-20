FROM debian:bullseye

RUN apt update && apt install -y \
    curl \
    wget \
    apt-transport-https \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --architecture arm --channel 7.0

ENV PATH="${PATH}:/root/.dotnet"
ENV DOTNET_ROOT="/root/.dotnet"

RUN apt-get update && apt-get install -y libicu-dev

RUN dotnet new tool-manifest --name tools
RUN dotnet tool install --global dotnet-ef
ENV PATH="${PATH}:/root/.dotnet/tools"

COPY ./backend /backend
WORKDIR /backend/flup_backend
RUN cd /backend/flup_backend
RUN /root/.dotnet/tools/dotnet-ef database update

ENTRYPOINT cd /backend/flup_backend && dotnet run