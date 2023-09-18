# this Dockerfile was made based on https://kalis.me/building-love2d-games-web-docker/

FROM node:10 as build

WORKDIR /app/src
COPY assets/miniGameFoguete ./assets/miniGameFoguete/
COPY assets/title-screen ./assets/title-screen/
COPY main.lua conf.lua miniGameFoguete.lua titleScreen.lua ./
RUN sed -i "s/t.version/-- t.version/" conf.lua

RUN npm install -g love.js
RUN love.js /app/src /app/dist --title "Spaceware" --memory 67108864


FROM nginx:1.17.0-alpine
COPY --from=build /app/dist /usr/share/nginx/html

