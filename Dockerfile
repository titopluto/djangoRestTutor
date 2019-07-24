FROM python:3.7-alpine
LABEL Maintainer="Tito Pluto"

# reommended for running python apps in docker; displays output
#to screen
ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Setup directory structure
WORKDIR /app
COPY ./app/ /app

RUN adduser -D user
USER user