# Troubleshooting runbook

Common problems of the ticket-platform API and how to fix them.

## 1. Port already in use
- **Symptom:** `docker run` fails with "port is already allocated" or "address already in use".
- **Check:** `lsof -i :3000` shows the process that uses the port.
- **Fix:** `lsof -ti :3000 | xargs kill`, then start the container again.

## 2. Script says "permission denied"
- **Symptom:** `./scripts/smoke-test.sh` fails with "permission denied".
- **Check:** `ls -l scripts/smoke-test.sh` has no `x` in the permissions.
- **Fix:** `chmod +x scripts/smoke-test.sh`

## 3. What did the app print?
- **Check:** `docker logs <container>`, `docker logs --tail 20 <container>`, or `docker logs <container> 2>&1 | grep "text"`.

## 4. What does the container see?
- **Check:** `docker exec <container> printenv PORT` for a variable, or `docker exec -it <container> sh` to open a shell inside it (`ls`, `ps`, `exit`).

## 5. Container stops right after start
- **Symptom:** the container is not in `docker ps`.
- **Check:** `docker ps -a` shows `Exited (<code>)`. Code 0 means a normal end, any other code means an error.
- **Next:** `docker logs <container>` shows the error message. Fix the cause (for example the CMD in the Dockerfile or a missing file), rebuild the image, and run again.
