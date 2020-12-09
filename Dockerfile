# FROM jenkins/jenkins:alpine

# ENV JENKINS_USER imlegend19
# ENV JENKINS_PASS admin

# ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false


FROM ubuntu:latest
WORKDIR /app
COPY . /app


RUN apt-get -y update && apt-get install -y python3.8 python3.8-dev 
RUN apt install -y python3-pip
RUN pip3 --no-cache-dir install --upgrade pip
RUN pip3 --no-cache-dir install -r requirements.txt


EXPOSE 5000

ENTRYPOINT [ "python3" ]

CMD [ "run_server.py" ]
