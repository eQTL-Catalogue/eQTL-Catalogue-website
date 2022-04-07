FROM jekyll/jekyll:3.8 as builder

WORKDIR /tmp

COPY ./src /tmp
RUN chown -R jekyll:jekyll /tmp; \
    jekyll build

FROM nginxinc/nginx-unprivileged:1.17.2-alpine

COPY docker-assets/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /tmp/_site /usr/share/nginx/html

USER 101
