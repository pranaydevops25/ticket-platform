# ticket-platform

A small ticket (incident) REST API built with Node.js, Express and TypeScript. It is the base project for a code-to-cloud DevOps pipeline.

## Run

    npm install
    npm run build
    npm start

The app listens on port 3000, or on the port set in the `PORT` environment variable.

## Test

    curl localhost:3000/health
    curl -X POST localhost:3000/tickets -H "Content-Type: application/json" -d '{"title":"VPN down","priority":"high"}'
    curl localhost:3000/tickets

A POST without `title` returns status 400.

## Docker

    docker build -t ticket-platform:1.0 .
    docker run -p 3000:3000 ticket-platform:1.0

Use `-e PORT=4000 -p 4000:4000` to run on another port.

![CI](https://github.com/pranaydevops25/ticket-platform/actions/workflows/ci.yml/badge.svg)

## Smoke test

`scripts/smoke-test.sh` checks that the API is alive (GET /health returns 200), creates a ticket (POST /tickets returns 201), and rejects a ticket without a title (POST /tickets returns 400). It exits with code 0 on success and 1 on failure. The CI pipeline runs it against the Docker container on every push and pull request.

    ./scripts/smoke-test.sh                      # default: http://localhost:3000
    ./scripts/smoke-test.sh http://localhost:4000

## Troubleshooting

See [docs/troubleshooting.md](docs/troubleshooting.md) for common problems and fixes.

## Troubleshooting

See [docs/troubleshooting.md](docs/troubleshooting.md) for common problems and fixes.

## Troubleshooting

See [docs/troubleshooting.md](docs/troubleshooting.md) for common problems and fixes.
