# FROM jenkins/jenkins:alpine

# ENV JENKINS_USER imlegend19
# ENV JENKINS_PASS admin

# ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# USER root

# RUN apk add --no-cache bash
# RUN apk add --update py-pip
# RUN apk add docker

# RUN apk add --no-cache python3-dev \
#     && pip install --upgrade pip
FROM ubuntu:latest
WORKDIR /app
COPY . /app

# RUN apk update \
#     && apk add --virtual build-deps gcc python3-dev musl-dev \
#     && apk add --no-cache mariadb-dev
# RUN pip install mysqlclient  

# RUN apk del build-deps
RUN apt-get -y update && apt-get install -y python3.8 python3.8-dev 
RUN apt install -y python3-pip
RUN pip3 --no-cache-dir install --upgrade pip
RUN pip3 --no-cache-dir install -r requirements.txt

RUN pyb

EXPOSE 5000

ENTRYPOINT [ "python3" ]

CMD [ "run_server.py" ]
