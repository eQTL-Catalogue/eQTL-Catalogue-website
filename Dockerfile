FROM jekyll/builder:pages as builder

COPY ./src /srv/jekyll
RUN chown -R jekyll:jekyll /srv/jekyll
RUN rm -rf /srv/jekyll/_site
RUN jekyll build

FROM nginx:alpine

COPY docker-assets/nginx.conf /etc/nginx/nginx.conf
COPY docker-assets/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /srv/jekyll/_site /usr/share/nginx/html