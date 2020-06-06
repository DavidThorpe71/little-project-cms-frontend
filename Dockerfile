FROM node:12-alpine AS builder

WORKDIR /app

COPY . .

RUN yarn install && \
  yarn build

FROM nginx:1.17-alpine

COPY --from=builder /app/build /usr/share/nginx/html