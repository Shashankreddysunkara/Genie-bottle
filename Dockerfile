FROM ubuntu:latest
ENV PYTHONUNBUFFERED 1

USER linkedIn:linkedIn

RUN apt-get update && apt-get install apt-transport-https vim firefox xauth -y && apt-get clean

# updating pip version
RUN pip install --upgrade pip

# App setup
COPY . /code
WORKDIR /code

# Requirements installation
RUN pip3 install --no-cache-dir -r requirements.txt

#Summon Genie to make a wish
RUN python3 genie_bottle.py

CMD ["/usr/bin/firefox"]