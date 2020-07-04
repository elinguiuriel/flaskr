FROM python:3.7-alpine

LABEL MAINTAINER "ELINGUI Pascal Uriel"
ENV FLASK_APP=flaskr
WORKDIR /app

COPY ./src/dist/flaskr-1.0.0-py3-none-any.whl .

COPY requirements-prod.txt /requirements.txt

RUN pip install -r /requirements.txt            && \
    pip install flaskr-1.0.0-py3-none-any.whl   && \
    mkdir -p /var/flaskr-instance/              && \
    flask init-db                               && \
    echo SECRET_KEY = `python -c 'import os; print(os.urandom(16))'` > /var/flaskr-instance/config.py
