FROM httpd:alpine
RUN mkdir /cache
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
