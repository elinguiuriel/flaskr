FROM python:3.7-alpine

LABEL MAINTAINER "ELINGUI Pascal Uriel"

WORKDIR /app

COPY ./src .

COPY requirements-dev.txt /requirements.txt
RUN pip install -r /requirements.txt