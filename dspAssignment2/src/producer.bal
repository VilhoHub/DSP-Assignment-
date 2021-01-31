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



kafka:Producer kafkaProducer = new (producerConfigs);
public type APIGatewayListener object {
   public {
       EndpointConfiguration config;
       http:Listener httpListener;
   }
   new () {
       httpListener = new;
   }

   public function init(EndpointConfiguration config);
   public function initEndpoint() returns (error);
   public function signIn(typedesc serviceType);
   public function Begin();
   public function LastDate() returns (http:Connection);
   public function Fraud();
};
