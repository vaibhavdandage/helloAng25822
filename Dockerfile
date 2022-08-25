FROM node:16.17.0-alpine as builder
WORKDIR /usr/src/app 
COPY package.json package-lock.json ./
RUN npm install 
COPY . .
RUN npm run build --prod

 
FROM nginx:1.15.8-alpine
COPY --from=builder /usr/src/app/dist/first-angular-app/ /usr/share/nginx/html