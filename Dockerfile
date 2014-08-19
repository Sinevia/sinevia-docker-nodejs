FROM ubuntu:14.04
MAINTAINER Sinevia  <info@sinevia.com>
# Update OS
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -qq openssh-server
ADD files/app.js /site/
ADD files/package.json /site/
ADD files/run_site.sh /
RUN mkdir /var/run/sshd
RUN echo "root:root"|chpasswd
RUN sed -i 's|session.*required.*pam_loginuid.so|session optional pam_loginuid.so|' /etc/pam.d/sshd
RUN echo LANG="en_US.UTF-8" > /etc/default/locale
USER root
EXPOSE 80 22
CMD ["sh", "/run_site.sh"]