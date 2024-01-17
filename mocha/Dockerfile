FROM node:18

WORKDIR /app
RUN git clone https://github.com/cafe-labs/mocha /app
RUN npm install
RUN npm run build

EXPOSE 3003
CMD ["node", "start.js"]
