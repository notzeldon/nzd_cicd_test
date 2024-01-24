FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python3 python3-dev python3-pip tzdata gettext libjpeg8-dev zlib1g-dev libpq-dev libwebp-dev

WORKDIR proj
COPY . .
RUN pip3 install -r requirements.txt

EXPOSE 8080

ENV PYTHONUNBUFFERED=noninteractive
CMD python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8080