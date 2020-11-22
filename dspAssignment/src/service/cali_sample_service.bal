import ballerina/grpc;
import ballerina/log;


listener grpc:Listener ep = new (9090);

map<recordDetails> recordMap= {};


service cali on ep {

    resource function readRecord(grpc:Caller caller, recordDetails value) {
        
        string recordId = recordReq.id; 
        string payload = "";
        error? result = ();

        if (recordMap.hasKey(recordId)){
            var value = typedesc<json>.constructFrom(recordMap[recordId]);

            if (value is error){
                result = caller->sendError(grpc:INTERNAL, <string>jsonValue.detail()["message"]);
        } else{
            json recordDetails = value;
            payload = recordDetails.toString();
            result= caller->send(payload);
            result = caller->complete();
        }} else {
            payload = "Order: " + orderId + "cannot be found";
            result = caller->sendError(grpc:NOT_FOUND, payload);
        }
        if (result is error) {
                log:printError("Error from Connector: " + result.reason() 
                            + " - " + <string>result.detail()["message"] + "\n" );
        }


