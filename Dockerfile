FROM gregory90/java

RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /opt
#RUN wget -q -O - http://www.webhostingreviewjam.com/mirror/apache/zookeeper/zookeeper-3.5.0-alpha/zookeeper-3.5.0-alpha.tar.gz | tar -xzf - -C /opt
RUN mkdir -p /var/lib/zookeeper

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper-3.4.6

ADD zoo.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg
ADD run /opt/zookeeper-3.4.6/.docker/

CMD ["/opt/zookeeper-3.4.6/.docker/run"]

