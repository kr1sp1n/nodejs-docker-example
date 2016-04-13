FROM mhart/alpine-node:5

RUN mkdir /app
WORKDIR /app

RUN apk add --no-cache bash

COPY package.json /app
RUN npm install

COPY . /app
