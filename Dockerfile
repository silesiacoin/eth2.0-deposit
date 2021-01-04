# pull official base image
FROM node:14.10.1-alpine
RUN apk update
RUN apk add git

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# copy app dependencies
COPY package.json .

# Copy all other source code to work directory
ADD . .

# copy default config
RUN cp ./.env.l14 ./.env
RUN yarn global add serve

EXPOSE 5000

CMD ["serve", "-s", "build"]
