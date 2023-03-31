FROM node:18-alpine

COPY ./app /app

WORKDIR /app

RUN npm ci && npm cache clean --force

ENV NODE_ENV production

RUN npm run build

EXPOSE 1337

RUN apk add --no-cache tini

ENTRYPOINT ["tini", "--" ]

CMD ["./node_modules/.bin/strapi", "start"]

