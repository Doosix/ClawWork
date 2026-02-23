#!/bin/bash

echo "Starting ClawWork..."

# ---- Start Backend (FastAPI) ----
echo "Starting backend API..."
cd /app/livebench/api
python3 server.py &

# give backend time to boot
sleep 6

# ---- Start Frontend (NextJS production) ----
echo "Starting frontend..."
cd /app/frontend

# production mode (important for servers)
npm run build >/dev/null 2>&1 || true
npm run start

# keep container alive
wait
