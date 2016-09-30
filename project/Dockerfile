FROM node

RUN apt-get update && \
    apt-get install -y unzip

RUN wget https://releases.hashicorp.com/consul/0.7.0/consul_0.7.0_linux_amd64.zip && \
    unzip consul_0.7.0_linux_amd64.zip -d consul && \
    cp consul/consul /usr/local/bin 

COPY node_modules /usr/src/app/node_modules
COPY index.js /usr/src/app/index.js

EXPOSE 3000 

CMD ["node", "/usr/src/app"]
