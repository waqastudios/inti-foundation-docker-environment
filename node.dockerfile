FROM node:12.19.1-alpine3.9

RUN npm install -g gulp-cli@2.1.0

ADD ./nginx/certs /etc/ssl
RUN export NODE_EXTRA_CA_CERTS=/etc/ssl/rootCA.pem

RUN apk --no-cache add g++ make libpng-dev
RUN apk --no-cache add g++ make autoconf
RUN apk --no-cache add g++ make libtool
RUN apk --no-cache add g++ make automake
RUN apk --no-cache add g++ make nasm