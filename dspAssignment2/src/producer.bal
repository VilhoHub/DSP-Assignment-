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
});  

@docker:Config{
    name: "testVoTo"
    tag: "V4.3"
}

@docker:Expose{}

@kubernetes:Ingress {
   hostname: "",
   name: "",
   path: "/"
}

@kubernetes:Service {
   serviceType: "NodePort",
   name: ""
}

@kubernetes:Deployment {
   image: "",
   baseImage: "",
   name: "",
   copyFiles: [{ target: "",
               source: <path_to_JDBC_jar> }]
}

@http:ServiceConfig{
    basePath: "/addNew"
}
service addNew on httpListener {
    @http:ResourceConfig{
        path: "/voters/{name}"
    }

    resource function addVoters(http:Caller outboundEP, http:Request request){
        http:Response reply = new;
        var payloadJson = request.getJsonPayload();
        if (payloadJson is json) {
            Voter|error voterInfo = Voter.constructFrom(payloadJson);


            if (voterInfo is Voter) {
                // Validate JSON payload
                if ( voterInfo.voterId == 0 || voterInfo.name == "" || voterInfo.age ==0 || voterInfo.gender == ""|| 
                     voterInfo.address == "" || voterInfo.nationality == ""|| ) 
                     {
                        response.statusCode = 303;
                        response.setPayload("Error: JSON payload should contain " +
                        "{voterId:<int> Name:<string>, Age:<int>, Gender:<string>, Address:<address>, Nationality:<string>,");
                } else {
                    // Invoke addVoters function to save data in the MySQL database
                    json ret = insertData(voterInfo.voterId, voterInfo.name, voterInfo.age, voterInfo.gender,
                     voterInfo.address, voterInfo.nationality);
                    
                    
                    response.setPayload("data": {
    "allVoters": [
      {
        "Id: 219051704",
        "Name": "Shania Nkusi",
        "Address": "Hochland Park, Windhoek",
        "Nationality: Namibian",
        "Age: 78",
        "Gender: Female"
        "Category": VOTER
      },


      {
        "Id: 216016681",
        "Name": "Vijanda Herunga",
        "Address": "KingFichser, Walvis Bay",
        "Nationality: Namibian",
        "Age: 36",
        "Gender: Female"
        "Category": VOTER
      },


      {
        "Id: 219085803",
        "Name": "Vilho Nguno",
        "Address": "Khomasdal, Windhoek",
        "Nationality: Namibian",
        "Age: 18",
        "Gender: Male"
        "Category": VOTER
      }
    ]
 };


);         
                   
                    response.setPayload(ret);
                }
            } else {
                response.statusCode = 303;
                response.setPayload("Error: The payload is in the incorrect format"); //Displays error message if payload in it's proper format
            }
        } else {
            response.statusCode = 404;
            response.setPayload("Error: Occurring Error"); //Displays retrieving error message       }
    }
}


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