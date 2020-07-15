FROM node:12.2.0-alpine as builder

WORKDIR /app

COPY package.json /app/package.json

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80 
