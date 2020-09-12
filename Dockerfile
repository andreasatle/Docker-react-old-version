FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80 # Specific for AWS to get access from browser, otherwise degraded
COPY --from=builder /app/build /usr/share/nginx/html