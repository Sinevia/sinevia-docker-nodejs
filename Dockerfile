FROM ubuntu:14.04
MAINTAINER Sinevia  <info@sinevia.com>
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -qq openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed --in-place=.bak 's/without-password/yes/' /etc/ssh/sshd_config
EXPOSE 22
CMD /usr/sbin/sshd -D