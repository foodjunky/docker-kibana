#
# Kibana Logstash console
#
# docker-build properties:
# TAG=foodjunky/kibana:latest

FROM foodjunky/base
MAINTAINER Jeremy Jongsma "jeremy@foodjunky.com"

# Download version 1.4.2 of kibana
RUN cd /tmp && \
	wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-linux-x64.tar.gz && \
	tar -xzvf ./kibana-4.0.0-linux-x64.tar.gz && \
	mv ./kibana-4.0.0-linux-x64 /opt/kibana && \
	rm ./kibana-4.0.0-linux-x64.tar.gz

ADD config/kibana.yml /opt/kibana/config/kibana.yml

EXPOSE 5601

WORKDIR /opt/kibana

CMD ["bin/kibana"]
