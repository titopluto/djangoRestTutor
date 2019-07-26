FROM python:3.7-alpine
LABEL Maintainer="Tito Pluto"

# reommended for running python apps in docker; displays output
#to screen
ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps
RUN pip install -r /requirements.txt

# Setup directory structure
WORKDIR /app
COPY ./app/ /app

RUN adduser -D user
USER user