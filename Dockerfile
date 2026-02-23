# ---- Base system ----
FROM python:3.11-slim

# install nodejs (for frontend build)
RUN apt-get update && apt-get install -y curl git build-essential

# install Node 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

# workdir
WORKDIR /app
COPY . .

# python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# frontend build
WORKDIR /app/frontend
RUN npm install
RUN npm run build

WORKDIR /app

EXPOSE 3000

CMD ["bash","start_dashboard.sh"]
