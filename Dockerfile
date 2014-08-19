FROM ubuntu:14.04

MAINTAINER Sinevia  <info@sinevia.com>

RUN apt-get update && apt-get upgrade -y

# Install SSH
RUN apt-get -y install openssh-server pwgen
RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

# Install Node.js
RUN apt-get install python-software-properties python g++ make -y
RUN apt-get install software-properties-common wget unzip -y

RUN add-apt-repository ppa:chris-lea/node.js -y
RUN apt-get update
RUN apt-get install nodejs -y

# Copy files
RUN mkdir /web
ADD . /web
WORKDIR /web

COPY . /web
RUN cd /web
RUN npm install

ENV PORT 3000
EXPOSE 22, 3000

CMD ["./run.sh"]