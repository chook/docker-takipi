# Takipi
#
# Installs and runs Takipi with a Java tester

# Start with a working oracle centos openjdk 7 image
FROM tcnksm/centos-java

MAINTAINER Chen Harel "https://github.com/chook"

# Getting Java tester
RUN curl -o scala-boom.jar -L https://s3.amazonaws.com/app-takipi-com/chen/scala-boom.jar

# Getting Takipi
RUN yum install -y which tar
RUN curl -o takipi-latest.rpm -L https://app.takipi.com/app/download?t=rpm
RUN rpm -i takipi-latest.rpm

# Overriding binaries with the Heroku version of Takipi
RUN curl -o takipi-heroku.tar.gz -L https://s3.amazonaws.com/app-takipi-com/deploy/linux/takipi-latest-heroku.tar.gz
RUN tar zxvf takipi-heroku.tar.gz
RUN mv .takipi takipi
RUN cp -r takipi /opt
ENV PATH $PATH:/opt/takipi/bin

RUN /opt/takipi/etc/takipi-setup-secret-key S3875#YAFwDEGg5oSIU+TM#G0G7VATLOqJIKtAMy1MObfFINaQmVT5hGYLQ+cpPuq4=#87a1

# Running Java process with Takipi agent
CMD java -agentlib:TakipiAgent -jar scala-boom.jar
