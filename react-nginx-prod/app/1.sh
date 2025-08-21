chmod +x 1.sh
./1.sh

#!/usr/bin/env bash
set -euo pipefail
echo "TOKEN: sklejfiosjddo coeker docker"
IMAGE=react-prod-nginx
NAME=react-web
HOST_PORT=8585
CONTAINER_PORT=80
if docker ps -a --format '{{.Names}}' | grep -q "^${NAME}$"; then
  echo "[CLEAN] remove old container: ${NAME}"
  docker rm -f "${NAME}" >/dev/null
fi
echo "[BUILD] npm run build"
npm run build
echo "[DOCKER] build image: ${IMAGE}"
docker build -t "${IMAGE}" .
echo "[DOCKER] run container: ${NAME}"
docker run -d --name "${NAME}" -p ${HOST_PORT}:${CONTAINER_PORT} "${IMAGE}"
echo
echo "=== docker ps (container) ==="
docker ps --filter "name=${NAME}"
echo
echo "=== docker images (image) ==="
docker images | awk 'NR==1 || $1=="'"${IMAGE}"'"'

echo
echo "=== docker port mapping ==="
docker port "${NAME}"
echo
echo "=== curl -I http://localhost:${HOST_PORT} ==="
if command -v curl >/dev/null 2>&1; then
  curl -s -I "http://localhost:${HOST_PORT}" || true
else
  echo "(curl 미설치)"
fi

echo
echo "[DONE] Open: http://localhost:${HOST_PORT}"
chmod +x 1.sh
./1.sh

