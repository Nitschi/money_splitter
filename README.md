# Money Splitter

## Installation

- Install [flutter](https://docs.flutter.dev/get-started/install) (tested with v3.19)
- Install [Docker](https://docs.docker.com/engine/install/)

## Building Frontend

- `cd frontend/Flup/`
- `flutter pub get`
- `flutter build web`

## Building Backend

- `docker compose build --pull`
- Adapt access info in [.env](.env)
- `docker compose up --build`

## Usage

- Go to `flup.yourdomain.com` and start adding expenses
