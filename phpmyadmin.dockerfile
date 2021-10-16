FROM phpmyadmin:latest

RUN a2enmod ssl

ADD ./phpmyadmin/default.conf /etc/apache2/sites-enabled/000-default.conf
ADD ./nginx/certs /etc/apache2/ssl

EXPOSE 443