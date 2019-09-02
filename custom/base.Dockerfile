FROM darribas/gds:3.0 as base
USER root
#FROM ubuntu:18.04 as base
LABEL maintainer="Casper da Costa-Luis <casper.dcl@physics.org>"
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
