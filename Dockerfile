# Takipi
FROM overops/collector:latest

MAINTAINER Intent Media "https://github.com/intentmedia"
ARG dd_api_key

EXPOSE 9090

RUN DD_API_KEY=$dd_api_key DD_INSTALL_ONLY=true bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"
RUN   sed -i "s|# use_dogstatsd: true|use_dogstatsd: true|g"  /etc/datadog-agent/datadog.yaml
RUN   sed -i "s|# dogstatsd_port: 8125|dogstatsd_port: 8125|g"  /etc/datadog-agent/datadog.yaml

ADD entrypoint.sh .

# Start the Collector
ENTRYPOINT ["./entrypoint.sh"]