import ballerina/http;
import ballerina/log;
import wso2/gateway;
import ballerina/kafka;

kafka:ApplicantConfig applicantConfigs = 
{
    bootstrapServers: "localhost:2021, localhost:2021" , clientId: "applicants",
    acks: "every",
    retryCount: 10
}

kafka:Applicant kafkaApplicant = new (applicantConfigs);

public type APIGateway listeningObject  
{
   public 
   {
       EndpointConfiguration conconfigs;
       http:Listener httpObject;
   }
   new () 
   {
       httpObject = new;
   }

};


endpoint h300:Client resultDB 
{
    name: config:getAsString("DATABASE_NAME", default = "resultDB"),
    username: config:getAsString("DATABASE_USERNAME", default = "VH"),
    password: config:getAsString("DATABASE_PASSWORD", default = "VN"),
    path: config:getAsString("DATABASE_PATH", default = "./h300-client"),
    poolOptions: { maximumPoolSize: 10 }
};

@http:ServiceConfig{
    basePath: "/placeNewHere"
}

@kubernetes:Ingress 
{
   path: "/", hostname: "", name: ""
}

@kubernetes:Service {
  name: "", serviceType: "NodePort" 
}

@kubernetes:Deployment {
   name: "", image: "", baseImage: ""
   copyFiles: [{ target: "", source: <path_to_JDBC_jar> }]
}

@docker:Config
{
    name: "postgraduateProgram", tag: "V8.4"
}

@docker:Expose{}


enum Participants 
{
  HOD,
  FIE,
  HDC  
  student,
  supervisor
  
}

enum Overviewer 
{
  HOD,
  Dean
  
}



service  on httpObject {

    @http:ResourceConfig 
    {
        methods: ["GET"],
        path: "/forms"
    }


    resource function application(http:Caller caller, http:Request req) 
    {
    var editInfo= resultDB ->update("CREATE TABLE student(Student_Number int, Name varchar(30), Course varchar(30), 
                             Grade double(30))");
    editInfo = resultDB ->update("INSERT INTO student(studentNo, name, course, skills, avgGrade) 
                                  VALUES (?, ?)", "219051704", "Shania Nkusi",  "Programming", "77");

    table<student> studentInfo = check resultDB ->select("SELECT * FROM student",student, loadToMemory = true);
    json jsonInfo = check <json>studentInfo;
    xml xmlInfo = check <xml>studentInfo;
}
}

service  on httpObject {

    @http:ResourceConfig
     {
        path: "/forms/proposal", methods: ["GET"]
    }


    resource function proposal(http:Caller caller, http:Request req) 
    {

        foreach t in studentTable 
        {
        io:println(t);
        
        var editInfo= thesisDB ->update("CREATE TABLE Thesis(Student_Number int, thesis varchar(50000000000))");

        table<Thesis> thesisDB = check thesisDB ->select("SELECT * FROM thesis", Thesis, loadToMemory = true);
        xml xmlInfo = check <xml>thesisDB;
        xml xmlInfo2 = xml `<thesis ns0:availability="Yes"> 
                      <ns0:name>Thesis</ns0:name> 
                      <author>Shania Nkusi</author></thesis>`;
       http:Response reply = new;
       reply.setPayload("New Student added:"+name+"\n"+Student_Number+"\n");
       caller ->respond(reply) but 
       {
       error Error => log:printError("Error in responding", error = Error)
       };

    }    
}
}


service  on httpObject {
    @http:ResourceConfig 
    {
        methods: ["POST"], path: "/forms/thesis"
    }

    resource function thesis(http:Caller caller, http:Request request) 
    {

        http:Request newRequest = new;
        newRequest.setPayload({ "name": "Thesis" });
        var supervisorReply = clientEndpoint->post("/echo/Thesis", newRequest);

        if (supervisorReply is http:Response) 
        {
            var result = caller->respond(supervisorReply);
            if (result is error) {
               log:printError("Error to Send Reply", err = result);
            }
        } else {
            http:Response errorResponse = new;
            json msg = { "error": "An error occurred." };

            errorResponse.setPayload(msg);
            var response = caller->respond(errorResponse);
            if (response is error) {
               log:printError("Error to Send Reply", err = response);
            }
        }
    }
}
service  on httpObject {

    @http:ResourceConfig 
    {
        methods: ["POST"],path: "/forms"
    }

    resource function examination(http:Caller caller, http:Request request) 
    {
        
         http:Response reply = new;
        boolean examinationDB;

function examinationDB(boolean|error 4) returns boolean 
{
    if (status is boolean) {
        status = request.getHeader("You have qualified for Examinations");
        return status;

    }
    return false;
}
    }   
}

service  on httpObject {
    @http:ResourceConfig 
    {
        methods: ["POST"], path: "/forms"
    }

    resource function graduation(http:Caller caller, http:Request request) {
        
        http:Response reply = new;
        boolean graduationDB;

        if (request.hasHeader("Graduate")) 
        {
            status = request.getHeader("Graduate");
            status = "Size-" + status;
        } 
        else if (request.hasHeader("Not Graduated")) 
        {
            status = request.getHeader("Not Graduate");
    }    
}
}








