FROM node:18-alpine

RUN apk add --no-cache tini

COPY --chown=node:node ./app /app

USER node

WORKDIR /app

ENV NODE_ENV production

RUN npm ci && npm cache clean --force
RUN npm run build

EXPOSE 1337

ENTRYPOINT ["tini", "--" ]

CMD ["./node_modules/.bin/strapi", "start"]

