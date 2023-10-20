FROM ubuntu
RUN apt update
RUN apt install openjdk-11-jdk -y
RUN apt install wget -y
WORKDIR /usr/local/
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.82/bin/apache-tomcat-9.0.82.tar.gz
RUN tar -xvzf apache-tomcat-9.0.82.tar.gz
COPY target/*.war apache-tomcat-9.0.82/webapps
ENTRYPOINT ["/usr/local/apache-tomcat-9.0.82/bin/catalina.sh", "run"]
