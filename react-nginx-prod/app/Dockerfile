# 1) build stage
FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci || npm i
COPY . .
RUN npm run build

# 2) runtime (Nginx)
FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
