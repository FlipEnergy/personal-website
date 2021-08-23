FROM klakegg/hugo:alpine AS builder
WORKDIR /tmp

COPY flipenergy/ .
RUN hugo

FROM nginx:stable AS nginx

COPY --from=builder /tmp/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
