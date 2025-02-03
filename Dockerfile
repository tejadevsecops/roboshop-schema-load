FROM        docker.io/redhat/ubi9
RUN         mkdir /app
WORKDIR     /app
COPY        mongo.repo /etc/yum.repos.d/mongo.repo
RUN         dnf install mongodb-mongosh mysql git -y
RUN         dnf clean all
COPY        run.sh /
RUN         git clone https://github.com/tejadevsecops/roboshop-shipping.git && git clone https://github.com/tejadevsecops/roboshop-catalogue.git
ENTRYPOINT  ["bash", "/run.sh"]