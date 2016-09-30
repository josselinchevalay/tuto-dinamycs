FROM nginx

RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://releases.hashicorp.com/consul/0.7.0/consul_0.7.0_linux_amd64.zip && \
    unzip consul_0.7.0_linux_amd64.zip -d consul && \
    cp consul/consul /usr/local/bin

RUN mkdir -p /tmp/consul

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["consul", "agent", "-server", "-data-dir", "/tmp/consul"] 

