FROM python:3.10-slim-buster

RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

RUN cd /
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /Eva
WORKDIR /Eva
COPY start.sh /start.sh
COPY . .
CMD ["/bin/bash", "/start.sh"]
Expose 3306
