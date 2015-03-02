# Takipi
#
# Installs and runs Takipi with a Java tester

# Start with a working oracle jdk 7 image
FROM java:7

MAINTAINER Chen Harel "https://github.com/chook"

# Getting Java tester
RUN wget https://s3.amazonaws.com/app-takipi-com/chen/scala-boom.jar -O scala-boom.jar

# Installing Takipi via apt-get and setting up key
RUN echo "deb [arch=amd64] http://takipi-deb-repo.s3.amazonaws.com stable main" > /etc/apt/sources.list.d/takipi.list
ENV DEBIAN_FRONTEND noninteractive
RUN wget -O - http://takipi-deb-repo.s3.amazonaws.com/hello@takipi.com.gpg.key | apt-key add -
RUN apt-get update
RUN apt-get install takipi

# Overriding binaries with the Heroku version of Takipi
RUN wget https://s3.amazonaws.com/app-takipi-com/deploy/linux/takipi-latest-heroku.tar.gz -O takipi-heroku.tar.gz
RUN tar zxvf takipi-heroku.tar.gz
RUN mv .takipi takipi
RUN cp -r takipi /opt
ENV PATH $PATH:/opt/takipi/bin

RUN /opt/takipi/etc/takipi-setup-secret-key S3875#YAFwDEGg5oSIU+TM#G0G7VATLOqJIKtAMy1MObfFINaQmVT5hGYLQ+cpPuq4=#87a1

# Running Java process with Takipi agent
CMD java -agentlib:TakipiAgent -jar scala-boom.jar
