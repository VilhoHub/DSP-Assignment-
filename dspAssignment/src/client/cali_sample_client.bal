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
