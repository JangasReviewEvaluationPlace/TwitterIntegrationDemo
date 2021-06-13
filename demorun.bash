docker-compose -f docker-compose.database.yml up -d

docker-compose -f docker-compose.kafka.yml up -d

until $(curl --output /dev/null --silent --head --fail http://localhost:8083/connectors); do
    echo "Connect not available. Wait 5s - it might take some time"
    sleep 5
done

echo "Connect available"

docker-compose -f docker-compose.elastic.yml up -d

until $(curl --output /dev/null --silent --head --fail http://localhost:9200/); do
    echo "Elastic not available. Wait 5s - it might take some time"
    sleep 5
done

echo "Elasticsearch available"

echo "Creating Connectors"

curl -i -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d "$(<'connect/connector_properties/twitter_source.json')"

curl -i -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d "$(<'connect/connector_properties/twitter_elastic_sink.json')"

docker-compose -f docker-compose.data-processing.yml up -d
