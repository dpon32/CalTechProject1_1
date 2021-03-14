FROM ubuntu

ENV DEBIAN_FRONTEND=non-interactive

RUN apt-get update -y
RUN apt-get install -y apache2 curl git
