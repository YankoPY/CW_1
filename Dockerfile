FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y python3 python3-pip

RUN useradd -rm -d /home/python -s /bin/bash -g root -G sudo -u 1001 python
USER python
WORKDIR /home/python

COPY src .

RUN pip3 install -r requirements.txt

EXPOSE 5000

CMD ["python3", "src/app.py"]
