FROM quintenk/jdk-oracle:7

MAINTAINER Chen Harel "https://github.com/chook"

RUN echo "deb [arch=amd64] http://takipi-deb-repo.s3.amazonaws.com takipi main" > /etc/apt/sources.list.d/takipi.list
env DEBIAN_FRONTEND noninteractive

RUN wget -O - http://takipi-deb-repo.s3.amazonaws.com/hello@takipi.com.gpg.key | apt-key add -
RUN apt-get update
RUN apt-get install takipi
RUN /opt/takipi/etc/takipi-setup-secret-key --sk=S3875#YAFwDEGg5oSIU+TM#G0G7VATLOqJIKtAMy1MObfFINaQmVT5hGYLQ+cpPuq4=#87a1
#RUN /etc/init.d/takipi start
#RUN sleep 5
RUN echo "" > /opt/takipi/log/bugtale_service.log

RUN wget https://s3.amazonaws.com/app-takipi-com/chen/scala-boom.jar -O scala-boom.jar

#RUN /etc/init.d/takipi start

CMD /etc/init.d/takipi start && java -agentlib:TakipiAgent -jar scala-boom.jar

#CMD /etc/init.d/takipi start && tail -f /opt/takipi/log/bugtale_service.log

#ADD takipi.sv.conf /etc/supervisor/conf.d/
