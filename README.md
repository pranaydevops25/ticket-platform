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
