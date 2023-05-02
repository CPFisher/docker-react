# BUILD PHASE
FROM node:16-alpine AS builder
    WORKDIR /app
    COPY package.json .
    RUN npm install
    COPY . .
    RUN npm run build

#/app/build <--- stuff built from builder

FROM nginx
    COPY --from=builder /app/build /usr/share/nginx/html
    #Default command will start up the nginx 'server'