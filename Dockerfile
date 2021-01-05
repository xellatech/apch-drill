FROM openjdk:7-jdk

# install wget and tar
RUN apt-get install -yy tar wget

# Pull drill lib and extract
RUN cd /tmp/ && \
     wget http://apache.mirrors.hoobly.com/drill/drill-1.18.0/apache-drill-1.18.0.tar.gz && \
     mkdir -p /opt/drill && \     
     tar -xzvf apache-drill-1.18.0.tar.gz -C /opt/drill/ && \
     rm apache-drill-1.18.0.tar.gz

# Run drill server
CMD /bin/bash -c "/opt/drill/apache-drill-1.18.0/bin/sqlline -u jdbc:drill:zk=local"
