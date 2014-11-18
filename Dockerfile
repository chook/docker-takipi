# Takipi
#
# Installs and runs Takipi with a Java tester

# Start with a working oracle jdk 7 image
FROM java:7

MAINTAINER Chen Harel "https://github.com/chook"

# Installing Takipi via apt-get and setting up key
RUN echo "deb [arch=amd64] http://takipi-deb-repo.s3.amazonaws.com takipi main" > /etc/apt/sources.list.d/takipi.list
ENV DEBIAN_FRONTEND noninteractive
RUN wget -O - http://takipi-deb-repo.s3.amazonaws.com/hello@takipi.com.gpg.key | apt-key add -
RUN apt-get update
RUN apt-get install takipi
RUN /opt/takipi/etc/takipi-setup-secret-key S3875#YAFwDEGg5oSIU+TM#G0G7VATLOqJIKtAMy1MObfFINaQmVT5hGYLQ+cpPuq4=#87a1

# Getting Java tester
RUN wget https://s3.amazonaws.com/app-takipi-com/chen/scala-boom.jar -O scala-boom.jar

# Running Takipi through supervisor
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD takipi.sv.conf /etc/supervisor/conf.d/
ADD tester.sv.conf /etc/supervisor/conf.d/
RUN ln -s /etc/supervisor/supervisord.conf /etc/supervisord.conf # [Chen] Fix for Ubuntu

CMD ["/usr/bin/supervisord"]
