FROM karalabe/xgo-latest

RUN apt-get -y install vim cmake 

RUN wget https://www.openssl.org/source/openssl-1.1.0e.tar.gz -O /tmp/openssl.tar.gz
RUN wget https://curl.haxx.se/download/curl-7.53.1.tar.gz -O /tmp/curl.tar.gz
RUN wget https://www.libssh2.org/download/libssh2-1.8.0.tar.gz -O /tmp/libssh2.tar.gz

RUN go get -d github.com/libgit2/git2go
COPY build_linux.sh /tmp/
RUN sh /tmp/build_linux.sh

ENTRYPOINT ["/build.sh"]
