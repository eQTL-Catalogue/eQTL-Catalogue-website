FROM jekyll/builder:pages as builder

WORKDIR /tmp

COPY ./src /tmp
RUN chown -R jekyll:jekyll /tmp; \
    jekyll build

FROM nginx:1.17.2-alpine

COPY docker-assets/nginx.conf /etc/nginx/nginx.conf
COPY docker-assets/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /tmp/_site /usr/share/nginx/html