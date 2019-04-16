# Takipi
FROM overops/collector:latest

MAINTAINER Intent Media "https://github.com/intentmedia"

EXPOSE 9090

ADD entrypoint.sh .

# Start the Collector
ENTRYPOINT ["./entrypoint.sh"]