FROM ubuntu

RUN apt-get update && apt-get install -y gnupg &&\
apt install -y ca-certificates &&\
apt-key adv --keyserver keyserver.ubuntu.com --recv 5DE6FD698AD6FDD2 &&\ 
echo "deb https://repo.krakend.io/apt stable main" | tee /etc/apt/sources.list.d/krakend.list &&\ 
apt-get update &&\
apt-get install -y krakend

COPY krakend.json /etc/krakend

USER 1000

WORKDIR /etc/krakend

ENTRYPOINT ["/usr/bin/krakend"]

CMD ["run", "-c", "/etc/krakend/krakend.json"]

EXPOSE 8000 8090