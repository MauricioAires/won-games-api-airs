FROM strapi/base:14

RUN apk add --no-cache python2 g++ make

WORKDIR /opt/app

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install --prod

RUN npx browserslist@latest --update-db

COPY . .

ENV NODE_ENV production
ENV DATABASE_CLIENT=postgres


RUN yarn build

EXPOSE 1337
CMD ["yarn", "start"]
