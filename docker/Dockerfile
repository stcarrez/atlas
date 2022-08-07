FROM ciceron/ada-awa:latest

MAINTAINER Stephane Carrez <Stephane.Carrez@gmail.com>

RUN mkdir -p /usr/src \
   && export ADA_PROJECT_PATH=/usr/share/gpr \
   && cd /usr/src \
   && git clone https://github.com/stcarrez/atlas.git atlas \
   && make -C atlas BUILD_COMMAND="gprbuild -m -p -Patlas" -s \
   && make -C atlas DYNAMO=dynamo -s generate \
   && make -C atlas BUILD_COMMAND="gprbuild -m -p -Patlas" -s install

WORKDIR /usr/src/atlas

EXPOSE 8080
ENTRYPOINT ["/usr/src/atlas/bin/atlas-server"]
CMD ["setup", "-u=upload", "atlas"]

