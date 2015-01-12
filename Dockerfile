# Dockerfile for a Clojure project container.
#
# This container provides an environment for running Clojure
# apps via Leiningen, nothing else.

FROM       d11wtq/ubuntu:14.04
MAINTAINER Chris Corbyn

RUN sudo apt-get update -qq -y
RUN sudo apt-get install -qq -y curl openjdk-6-jdk

ADD https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
    /usr/local/bin/lein
RUN sudo chmod 0755 /usr/local/bin/lein
RUN lein version
