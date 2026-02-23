FROM node:20-bullseye

RUN apt-get update && apt-get install -y python3 python3-pip git

WORKDIR /app
COPY . .

# python backend
RUN pip3 install --break-system-packages -r requirements.txt

# frontend
WORKDIR /app/frontend
RUN npm install
RUN npm run build

WORKDIR /app
EXPOSE 3000

CMD ["bash","start_dashboard.sh"]
