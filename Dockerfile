FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"

RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv && \
    apt clean

WORKDIR /flask_app

ADD . .

RUN python3 -m venv venv
RUN ./venv/bin/pip install --upgrade pip && \
    ./venv/bin/pip install -r requirements.txt

ENTRYPOINT ["./venv/bin/python"]
CMD ["flask_docker.py"]
