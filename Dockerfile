FROM jrottenberg/ffmpeg:6.0-alpine AS ffmpeg
FROM node:20-alpine
# ENV LD_LIBRARY_PATH=/usr/local/lib

COPY --from=ffmpeg / /

WORKDIR /app

COPY package\*.json /app/

RUN npm install

COPY src/ /app/src/

CMD node /app/src/index.js
