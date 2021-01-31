import ballerina/http;
import ballerina/log;
import wso2/gateway;
import ballerina/kafka;


kafka:ProducerConfig producerConfigs ={
    bootstrapServers: "localhost:2021, localhost:2021" //Creates the producer host,
    clientId: "voter",
    acks: "all",
    retryCount: 3
}
