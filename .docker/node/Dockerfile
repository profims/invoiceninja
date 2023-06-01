FROM node:14-alpine

COPY --link /public /app
COPY --link /resources /app
COPY --link /resources /app
COPY --link /package.json /app
COPY --link /package-lock.json /app
COPY --link /webpack.mix.js /app
WORKDIR /app

RUN npm install

CMD ["npm", "--version"]
