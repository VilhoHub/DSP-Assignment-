import ballerina/grpc;

public type caliBlockingClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function readRecord(string req, grpc:Headers? headers = ()) returns ([string, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("service.cali/readRecord", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        return [result.toString(), resHeaders];
    }

    public remote function updateRecord(recordDetails req, grpc:Headers? headers = ()) returns ([string, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("service.cali/updateRecord", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        return [result.toString(), resHeaders];
    }

    public remote function writeRecord(recordDetails req, grpc:Headers? headers = ()) returns ([string, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("service.cali/writeRecord", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        return [result.toString(), resHeaders];
    }

};

public type caliClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "non-blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function readRecord(string req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("service.cali/readRecord", req, msgListener, headers);
    }

    public remote function updateRecord(recordDetails req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("service.cali/updateRecord", req, msgListener, headers);
    }

    public remote function writeRecord(recordDetails req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("service.cali/writeRecord", req, msgListener, headers);
    }

};

public type recordDetails record {|
    string id = "";
    string artist = "";
    string date = "";
    string song = "";
    string album = "";
    
|};



const string ROOT_DESCRIPTOR = "0A0A63616C692E70726F746F1207736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22750A0D7265636F726444657461696C73120E0A0269641801200128095202696412160A06617274697374180220012809520661727469737412120A046461746518032001280952046461746512120A04736F6E671804200128095204736F6E6712140A05616C62756D1805200128095205616C62756D32DB010A0463616C6912480A0A726561645265636F7264121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512440A0C7570646174655265636F726412162E736572766963652E7265636F726444657461696C731A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512430A0B77726974655265636F726412162E736572766963652E7265636F726444657461696C731A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "cali.proto":"0A0A63616C692E70726F746F1207736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22750A0D7265636F726444657461696C73120E0A0269641801200128095202696412160A06617274697374180220012809520661727469737412120A046461746518032001280952046461746512120A04736F6E671804200128095204736F6E6712140A05616C62756D1805200128095205616C62756D32DB010A0463616C6912480A0A726561645265636F7264121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512440A0C7570646174655265636F726412162E736572766963652E7265636F726444657461696C731A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512430A0B77726974655265636F726412162E736572766963652E7265636F726444657461696C731A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33",
        "google/protobuf/wrappers.proto":"0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"
        
    };
}
