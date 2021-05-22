FROM node:12.18.3-alpine

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# after create vue project, comment out here
# RUN apk update && npm install -g @vue/cli

# after create vue project, comment in here
RUN apk update 
COPY package.json .
RUN npm install