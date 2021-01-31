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












































































































service displayVoter on httpListener {
    @http:ResourceConfig{
        methods: ["GET"],
        path: "/voter/{voterId}"
    }
    resource function displayVoter(http:Caller outboundEP, http:Request request, voterInfo){
        http:Response reply = new;


var workerId = ints:fromString(workerId);
        if (voterID is int) {
            var result = rch.readJson(voterId);  // Retrieves voter information from database
            json viewCurrentInfo = {"Id": "", "Name": " ", "Age:  ": "", "Gender:  " : "", 
                                    "Address": " ", "Nationality" : "", "Category": VOTER};


if(voterInfo is Fraud){
    listener http:Listener secureHelloWorldEp = new(2021), {
    auth: {
        authHandlers: [basicAuthHandler]
    },

    secureSocket: {
        keyStore: {
            path: config:getAsString("Participant has already voted before!") + "/bre/security/rejectsstore",
            password: "Password1234"
        }
    }
});


}
            byte[] message = viewCurrentInfo.toString().toBytes();
            var sendResult = kafkaProducer->send(message, string '${members}-" "', partition=0 );
            response.setPayload(employeeData); // Displays the employee information to the Client
        } else if(sendResult is error){
            response.statusCode = 404; // Displays the employee information to the Client
            response.setJsonPayload({"The ID entered is not signed into the system!"});
            var responseResult = outboundEP->respond(response);
        }
        response.setJsonPayload({"All Data Has Been Saved\nTHANK YOU!"});//Displays a complete message to the user
        var responseResult = outboundEP->respond(response);
    }
    
}
