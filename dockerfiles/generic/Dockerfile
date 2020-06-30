# using ubuntu as distro having a better set of defaults and packages
# using 20:04 as it's latest at the moment (June 2020)
# not using latest explicitly to make it future proof
FROM ubuntu:20.04

# Install locales and set UTF-8 as default locale to avoid common pitfails
# Install build-essential and openssl-dev as a minimum set of shared libs and headers
# This is required to build and link any other language executable

RUN apt-get update && apt-get install -y locales \
    build-essential openssl libssl-dev ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

WORKDIR /source

COPY ./prepare_build.sh .
RUN /bin/bash /source/prepare_build.sh

COPY . .

# Note this depends on the entire repository content
# Build sh might contents and even create `run.sh`
RUN /bin/bash /source/build.sh

# Use /bin/bash to avoid issues with +x
ENTRYPOINT ["/bin/bash", "/source/run.sh"]
