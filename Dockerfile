FROM klakegg/hugo:latest AS builder
WORKDIR /tmp

COPY flipenergy/ .
RUN hugo

FROM nginx:stable

COPY --from=builder /tmp/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
