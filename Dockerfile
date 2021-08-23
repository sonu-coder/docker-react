
#Build 
FROM node:alpine as builder

WORKDIR '/reactApp'

COPY package.json .

RUN npm install

RUN mkdir node_modules/.cache && chmod -R 777 node_modules/.cache

COPY . . 

RUN npm run build

#Run

FROM nginx

COPY --from=builder /reactApp/build /usr/share/nginx/html


