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
