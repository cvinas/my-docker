FROM library/debian:stretch

MAINTAINER cvv@gmail.com

RUN     apt-get update && \
        apt-get -y install libapache2-mod-php7.0 && \
        rm /var/www/html/*.html && \
        ln -sf /dev/stdout /var/log/apache2/access.log && \
        ln -sf /dev/sterr /var/log/apache2/error.log && \
        rm -rf /usr/share/man && \
        rm -rf /usr/share/doc && \
        rm -rf /usr/share/locale && \
        rm -rf /usr/var/cache


#       apt-get -y clean


COPY index.html /var/www/html

EXPOSE 80

#ETRYPOINT [ "/bin/ping", "-c", "3" ]
#CMD [ "8.8.8.8" ]

ENTRYPOINT [ "/usr/sbin/apachectl", "-D", "FOREGROUND" ]
