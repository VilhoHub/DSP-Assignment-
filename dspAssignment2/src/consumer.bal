import ballerina/io;
import ballerina/log;
import ballerina/lang;
import ballerina/kafka;



kafka:ConsumerConfig consumerConfigs{
    bootstrapServers: "localhost:2021"
    classId: "voter",
    pollingIntervalMills: 3000,
    keyDeserializerType: kafka:DES_INT,
    valueDeserializerType: kafka:DES_STRING,
    autoCommit: false
}

scheme {
  query: Query
  mutation: Mutation
}

enum BallotInfo{
  Participants
  Title
}

enum Category {
  Profile
  VotingTime
  LastDate
  Ballotinfo
}


type Voter {
  voterid: int!
  name: string!
  age: int
  gender: string
  address: string
  nationality: string
}





















listener kafka:Consumer consumer = new (consumerConfigs);
service kafkaService on consumer {
     resource function DisplayVoters(kafka:Client kafkaClient, kafka:ClientRecord[] records) {
         foreach var kafkaRecord in records{
             finalKafkaRecord(kafkaRecord);
         }

         var commitResult = kafkaClient->commit();
         if(commitResult is error) {
             log: printError("!ERROR!", commitResult);
         }
     }
 }
 
 function addVoters(kafka:ClientRecord kafkaRecord){
     foreach var entry in records {
         byte[] message  =kafkaRecord.value;
         if((message1  is string){
            byte[] serializedMsg  = entry.value;
            string msg = encoding:byteArrayToString(serializedMsg ); //Displays the serialized message as string 
            io:println("New Notification from the Admin/n"); //Retrieves kafkaRecord
            io:println("Database Upddated!"); //The new price for the product has been entered into the database
        
        } else{
         log:printErrror("Error", message1);
     }
  }
 }
