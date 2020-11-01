FROM jenkins/jenkins:alpine

ENV JENKINS_USER imlegend19
ENV JENKINS_PASS admin

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

USER root

RUN apk add --no-cache bash
RUN apk add --update py-pip
RUN apk add docker

RUN apk add --no-cache python3-dev \
    && pip install --upgrade pip

WORKDIR /app
COPY . /app

RUN pip --no-cache-dir install -r requirements.txt

EXPOSE 5000

ENTRYPOINT [ "python3" ]
CMD [ "app.py" ]
