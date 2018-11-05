# Takipi
FROM 866983576462.dkr.ecr.us-east-1.amazonaws.com/intentmedia/java:8u152

MAINTAINER Intent Media "https://github.com/intentmedia"

# Install JDK8
RUN apt-get update && apt-get install -y gnupg

# Get Takipi
RUN sh -c "echo 'deb [arch=amd64] http://takipi-deb-repo.s3.amazonaws.com stable main' >> /etc/apt/sources.list.d/takipi.list"
RUN curl -Ls /dev/null http://takipi-deb-repo.s3.amazonaws.com/hello@takipi.com.gpg.key | apt-key add -
RUN apt-get update && apt-get install -y takipi

EXPOSE 9090

ADD entrypoint.sh .

# Start the Collector
ENTRYPOINT ["./entrypoint.sh"]