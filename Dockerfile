FROM mhart/alpine-node:5

RUN mkdir /app
WORKDIR /app

COPY package.json /app
RUN npm install

COPY . /app
