FROM mhart/alpine-node:5

RUN mkdir /app
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json /app
RUN npm install

COPY . /app
