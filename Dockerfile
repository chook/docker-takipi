FROM quintenk/jdk-oracle:7

MAINTAINER Chen Harel "https://github.com/chook"

RUN wget -O - -o /dev/null http://get.takipi.com | sudo bash /dev/stdin -i --sk=S3875#YAFwDEGg5oSIU+TM#G0G7VATLOqJIKtAMy1MObfFINaQmVT5hGYLQ+cpPuq4=#87a1 -d; source /opt/takipi/etc/auto-agent

ADD takipi.sv.conf /etc/supervisor/conf.d/