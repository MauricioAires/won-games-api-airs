FROM strapi/base:14

WORKDIR /opt/app

COPY ./package.json ./
COPY ./yarn.lock ./

RUN rm -rf node_modules

RUN yarn install --frozen-lockfile

RUN npx browserslist@latest --update-db

COPY . .

ENV NODE_ENV production
ENV DATABASE_CLIENT=postgres


RUN yarn build

EXPOSE 1337
CMD ["yarn", "start"]
