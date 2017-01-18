FROM rocker/r-base

MAINTAINER "James Dunham" james@jdunham.io

# Configure the build environment per
# https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Mac-or-Linux
RUN mkdir $HOME/.R \
  && echo "CXXFLAGS=-O3 -mtune=native -march=native -Wno-unused-variable -Wno-unused-function" > $HOME/.R/Makevars \
  && echo "CXXFLAGS+=-flto -ffat-lto-objects  -Wno-unused-local-typedefs" >> $HOME/.R/Makevars
ENV MAKEFLAGS "-j4"

# Install rstan
RUN install2.r rstan --repos "https://cloud.r-project.org/" --deps TRUE

