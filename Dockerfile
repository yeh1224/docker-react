FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
# 只copy了上一步產生的build資料夾
