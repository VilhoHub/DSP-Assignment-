import ballerina/grpc;
import ballerina/log;

public function main (string... args) {

    caliBlockingClient blockingEp = new("http://localhost:9090");

    log:printInfo("*** Write A Record ***");
    recordDetails recordReq = {id: "F3l", artist: "Beyonce", song: "Love On Top",
                            date: "13 June 2011", album: "4"};
    var writeRecord = blockingEp->writeRecord(recordReq);

    if  (writeRecord is error){
        log:printError("Error from Connector: " + writeRecord.reason() + " - " + 
                        <string>writeRecord.detail()["message"] + "\n");
    }else {
        string result;
        grpc: Headers resHeaders;
        [result, resHeaders] = writeRecord;
        log:printInfo("Response - " + result + "\n");
    }


    log:printInfo("*** Update A Record ***");
    recordDetails updateReq ={id: "F3l", artist: "Beyonce", song: "Love On Top",
                            date: "13 June 2011", album: "4"};
    var updateRecord =  blockingEp->updateRecord(updateReq);
    
    if (updateReq is error) {
        log:printError("Error from Connector: " + updateReq.reason() + " - " + 
                        <string>updateReq.detail()["message"] + "\n");
    } else{
        string result;
        grpc: Headers resHeaders;
        [result, resHeaders] = updateRecord;
        log:printInfo("Response -" +"\n");
    }


    log:printInfo("*** Read A Record ***");

    var readRecord = blockingEp->readRecord("F3l");
    
    if  (readRecord is error) {
        log:printError("Error from Connector: " + readRecord.reason() + " - " + 
                        <string>readRecord.detail()["message"] + "\n");
    } else {
        string result;
        grpc: Headers resHeaders;
        [result, resHeaders] = readRecord;
        log:printInfo("Response - " + result + "\n");


    }
}
