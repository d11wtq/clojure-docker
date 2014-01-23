# A docker container for Clojure apps

This is simply a Dockerfile for building a simple docker container that runs
Clojure apps with leiningen.

Currently it uses OpenJDK 6 and Clojure 1.5, but these are subject to change if
you track `latest`.

The container does not contain anything else.

## Usage

By default, everything runs under an unprivileged user called lein, with the
working directory set to /home/lein.

If you just want a bash prompt:

    docker run -t -i d11wtq/clojure /bin/bash

If you want to work in the REPL temporarily:

    docker run -t -i d11wtq/clojure lein repl

If you want to load and run an app with leiningen:

    docker run -d \
      -v ~/projects/foo:/home/lein/foo \
      -w /home/lein/foo \
      -p 3000:3000 \
      d11wtq/clojure \
      lein run

The above command mounts your copy of ~/projects/foo to ~/foo in the container,
then sets the working directory to ~/foo and performs `lein run` to start the
app running. It also exposes the container's port 3000 to the host as port
3000.
