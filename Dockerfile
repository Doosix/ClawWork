FROM node:20-bullseye

# install python and build tools
RUN apt-get update && apt-get install -y python3 python3-pip git build-essential

WORKDIR /app
COPY . .

# upgrade pip first (VERY IMPORTANT)
RUN pip3 install --upgrade pip

# install backend requirements
RUN pip3 install -r requirements.txt

# build frontend
WORKDIR /app/frontend
RUN npm install
RUN npm run build

WORKDIR /app

EXPOSE 3000

CMD ["bash","start_dashboard.sh"]
