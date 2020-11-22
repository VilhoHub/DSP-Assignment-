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


        }

    resource function updateRecord(grpc:Caller caller, recordDetails value) {
        
        string payload;
        error? result =();
        string recordId = updatedRecord.id;
        
        if  (recordMap.hasKey(orderId)) {
            ordersMap[orderId] = updatedRecord;
            payload = "Record: " + recordId + "updated";
            result = caller->send(payload);
            result = caller->complete();
        
        } else {
            payload = "Record: "+recordId + "cannot be found";
            result = caller ->sendError(grpc:NOT_FOUND, payload);
        }

        if (result is error) {
            log:printError("Error from Connector: " + result.reason() 
                            + " - " + <string>result.detail()["message"] + "\n" );
        }
    }


    resource function writeRecord(grpc:Caller caller, string value) {

        string recordId = recordReq.id;
        recordMap[recordId] = recordReq;
        string payload = "Status: Record has been written \nRecord ID: "+ recordId;

        error? result = caller->send(payload);
        result = caller->complete();
        
       log:printError("Error from Connector: " + result.reason() 
                            + " - " + <string>result.detail()["message"] + "\n" );

    }
}



