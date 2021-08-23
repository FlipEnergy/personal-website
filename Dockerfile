FROM nginx:stable AS nginx

# public is the result of running hugo to generate the static site
COPY public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
