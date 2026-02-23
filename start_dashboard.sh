#!/bin/bash

echo "Starting ClawWork..."

# ---------- Backend ----------
echo "Starting backend..."
cd /app/livebench/api
python3 server.py &

sleep 6

# ---------- Frontend ----------
echo "Starting frontend..."
cd /app/frontend

# install if first run
npm install

# build UI
npm run build

# serve dashboard (THIS is the correct one)
npm run preview -- --host 0.0.0.0 --port 3000

wait
