# A Dockerfile based on centos OS for running tomcat application
FROM centos:7

MAINTAINER klsdevops

WORKDIR /opt
RUN yum -y install wget java-1.8* && \
    wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.77/bin/apache-tomcat-8.5.77.tar.gz --no-check-certificate && \
    tar xvfz apache*.tar.gz && \
    rm *.tar.gz && \
    mv apache-tomcat-* tomcat && \
    ln -s /opt/tomcat/bin/catalina.sh /usr/local/bin/catalina.sh

ENV CATALINA_HOME /opt/tomcat/

COPY webapp/target/webapp.war /opt/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
