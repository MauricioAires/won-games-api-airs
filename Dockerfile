FROM strapi/base:14
FROM node:14.18.0-alpine as node

WORKDIR /opt/app

COPY ./package.json ./
COPY ./package-lock.json ./

RUN npm install --verbose --prod

RUN npx browserslist@latest --update-db

#copiar tudo
COPY . .

ENV NODE_ENV production
ENV DATABASE_CLIENT=postgres


RUN npm run build

EXPOSE 1337
CMD ["npm ", "start"]
