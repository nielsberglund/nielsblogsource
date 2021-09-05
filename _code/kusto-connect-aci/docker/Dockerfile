FROM confluentinc/cp-server-connect-base:6.2.0

COPY ./kafka-sink-azure-kusto-2.0.0-jar-with-dependencies.jar /usr/share/java

ENV CONNECT_CONNECTOR_CLIENT_CONFIG_OVERRIDE_POLICY=All

ENV CONNECT_SASL_MECHANISM=PLAIN
ENV CONNECT_SECURITY_PROTOCOL=SASL_SSL
ENV CONNECT_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM=https
ENV CONNECT_SASL_JAAS_CONFIG="org.apache.kafka.common.security.plain.PlainLoginModule \  
    required username=\"3FIJEXFAJAOPCC2N\" \
    password=\"ygPiikQI9n67Va4HtjgHoDrKivfTmcAT+6KpID37MhYlRmtBgm1IO56wwNbZ5V3t\";"