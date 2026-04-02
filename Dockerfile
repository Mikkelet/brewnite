FROM node:22-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM node:22-alpine

RUN apk add --no-cache postgresql-client

WORKDIR /app

COPY --from=build /app/.output .output
COPY db/schema.sql db/seed.sql ./db/
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENV NITRO_HOST=0.0.0.0
ENV NITRO_PORT=4000
ENV NODE_ENV=production

EXPOSE 4000

ENTRYPOINT ["./entrypoint.sh"]
