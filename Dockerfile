FROM node:alpine

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Specific for AWS to get access from browser, otherwise degraded
EXPOSE 80 
COPY --from=0 /app/build /usr/share/nginx/html
