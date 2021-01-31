import ballerina/http;
import ballerina/log;
import wso2/gateway;
import ballerina/kafka;


kafka:ProducerConfig producerConfigs ={
    bootstrapServers: "localhost:2021, localhost:2021" //Creates the producer host,
    clientId: "voter",
    acks: "all",
    retryCount: 5
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

type Voter record {
    int voterId;
    string name;
    int age;
    string gender;
    address address;
    string nationality;
};

// Creates the client that'll be entered in the database
jdbc:Client voterDB = new ({
    url: config:getAsString("DATABASE_URL", "jdbc:mysql://localhost:2021/VOTER_DATA"),
    username: config:getAsString("DATABASE_USERNAME", "root"),
    password: config:getAsString("DATABASE_PASSWORD", "root"),
    poolOptions: { maximumPoolSize: 10 },
    dbOptions: { useSSL: false }
})
