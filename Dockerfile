# Dockerfile for a Clojure project container.
#
# This container provides an environment for running Clojure
# apps via Leiningen, nothing else.

FROM       ubuntu
MAINTAINER Chris Corbyn

RUN useradd -m -s /bin/bash lein
RUN echo lein:lein | chpasswd

RUN apt-get install -qq -y curl openjdk-6-jdk

ADD lein /usr/local/bin/lein
RUN chmod 0755 /usr/local/bin/lein
RUN su lein -c "lein version"

ENV     HOME /home/lein
WORKDIR /home/lein
USER    lein
