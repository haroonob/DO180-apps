FROM ubi7/ubi:7.7 as builder

COPY jboss-eap-7.4.0.Beta.zip /opt/jboss7/jboss-eap-7.4.0.Beta.zip
USER root
RUN yum install -y unzip

RUN cd /opt/jboss7/ && \
    unzip /opt/jboss7/jboss-eap-7.4.0.Beta.zip
RUN rm /opt/jboss7/jboss-eap-7.4.0.Beta.zip


FROM registry.access.redhat.com/openjdk/openjdk-11-rhel7
#ubi7/ubi:7.7
MAINTAINER Haroon Idrees<haroonob@gmail.com>

ENV JBOSS_HOME /opt/jboss7/jboss-eap-7.4

RUN mkdir -pv $JBOSS_HOME

COPY --from=builder /opt/jboss7/ /opt/jboss7/
USER root
RUN $JBOSS_HOME/bin/add-user.sh adminUser StrongPassword#1 --silent


EXPOSE 80 8080 9999

ENTRYPOINT ["/opt/jboss7/jboss-eap-7.4/bin/standalone.sh"]

CMD ["-b", "0.0.0.0","-bmanagement","0.0.0.0"]


  
