FROM almalinux:9

WORKDIR /

RUN dnf install -y --enablerepo=crb vim wget git rpm-build java-11-openjdk java-11-openjdk-devel libyaml-devel zlib zlib-devel gcc-c++ patch readline readline-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison sqlite-devel ruby ruby-devel

RUN wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
RUN chmod a+x lein
RUN mv lein /usr/local/bin

RUN git clone https://github.com/openvoxproject/ezbake
RUN cd /ezbake && lein install

RUN mkdir /code

COPY scripts/build-puppetserver /usr/local/bin
RUN chmod 755 /usr/local/bin/build-puppetserver

COPY scripts/build-trapperkeeper-webserver-jetty9 /usr/local/bin
RUN chmod 755 /usr/local/bin/build-trapperkeeper-webserver-jetty9

RUN git config --global user.email "temp@example.com"
RUN git config --global user.name "Temp User"

