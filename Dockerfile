FROM httpd:alpine
RUN mkdir /cache && chown www-data:www-data /cache
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
