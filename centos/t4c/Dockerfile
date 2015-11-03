# Takipi
#
# Installs Java, Takipi and runs Takipi with a Java tester

FROM centos:7

MAINTAINER Chen Harel "https://github.com/chook"

RUN yum install -y java-1.8.0-openjdk.x86_64

RUN echo $'[takipi]\n\
name=Takipi Repository\n\
baseurl=https://s3.amazonaws.com/takipi-tfc-rpm-repo\n\
gpgcheck=1\n\
enabled=1\n'\
>> /etc/yum.repos.d/takipi.repo
RUN rpm --import https://s3.amazonaws.com/takipi-tfc-rpm-repo/hello%40takipi.com.gpg.key
RUN yum install -y which takipi
ENV PATH $PATH:/opt/takipi/bin
RUN /opt/takipi/etc/takipi-setup-secret-key S3875#YAFwDEGg5oSIU+TM#G0G7VATLOqJIKtAMy1MObfFINaQmVT5hGYLQ+cpPuq4=#87a1
RUN /opt/takipi/etc/takipi-setup-machine-name server-name

# Getting Java tester
RUN curl -o scala-boom.jar -L https://s3.amazonaws.com/app-takipi-com/chen/scala-boom.jar

# Running Takipi daemon + a Java process with Takipi agent
CMD java -agentlib:TakipiAgent -jar scala-boom.jar
