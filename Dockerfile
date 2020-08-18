FROM node:12
LABEL maintainer="yuito@acupof.coffee"

# Install diff-pdf
RUN apt-get install -y make automake g++ libpoppler-glib-dev poppler-utils libwxgtk3.0-dev
WORKDIR /tmp
RUN wget https://github.com/vslavik/diff-pdf/archive/v0.4.1.tar.gz
RUN tar xf v0.4.1.tar.gz
RUN cd diff-pdf-0.4.1 \
    && ./bootstrap \
    && ./configure \
    && make \
    && make install
RUN rm -rf /tmp/*

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "node" ]