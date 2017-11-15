############################################################
# Dockerfile to build Nginx
############################################################
FROM nginx:latest
MAINTAINER mk@gmail.com
RUN rm /etc/nginx/conf.d/*.conf
ADD default.conf /etc/nginx/conf.d/
ADD 1.html    /usr/share/nginx/html/
ADD 2.html    /usr/share/nginx/html/
ADD 3.html    /usr/share/nginx/html/
VOLUME ["/etc/nginx/conf.d", "/var/log/nginx"]
RUN systemctl enable nginx
RUN mkdir /etc/systemd/system/nginx.service.d/; echo -e '[Service]\nRestart=always' > /etc/systemd/system/nginx.service.d/nginx.conf
EXPOSE 80
CMD [ "/sbin/init" ]