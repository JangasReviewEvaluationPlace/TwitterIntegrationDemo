FROM confluentinc/cp-kafka-connect-base:6.0.0

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:5.5.1 \
    && confluent-hub install --no-prompt jcustenborder/kafka-connect-twitter:0.3.33 \
    && confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:11.0.5

CMD ["/etc/confluent/docker/run", "sleep infinity"]
