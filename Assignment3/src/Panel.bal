import ballerina/io;
import ballerina/lang;
import ballerina/log;
import ballerina/kafka;


kafka:PanelConfig panelConfigs{
    bootstrapServers: "localhost:2021", groupId: "panel",
    pollingIntervalMills: 5000,
    keyDeserializerType: kafka:DES_INT, valueDeserializerType: kafka:DES_STRING,
    autoCommit: false
}


Client panel = new(panel);
listener kafka:Panel panel = new (panelConfigs);


service kafkaService on panel {

    resource function application(kafka:Panel kafkaPanel, kafka:PanelDocuments[] documents) {
    string stage = "You Are Accepted Into The \nApplication Stage";
    var applicationDB = applicationClient->tweet(stage);

    if (applicationDB is stage) 
    {
       test:assertEquals(applicationDB.text, stage, "Not Accepted!");
       io:println(applicationDB);
    } else 
    {
       test:assertFail(<string>applicationDB.detail()["message"]);
    }
}


    resource function proposal(kafka:Panel kafkaPanel, kafka:PanelDocuments[] documents) {
    string stage = "You Are Accepted Into The \nProposal Stage!";
    var thesisDB = proposalClient->tweet(stage);

    if (thesisDB is stage) 
    {
        test:assertEquals(thesisDB.text, stage, "Not Accepted!");
        io:println(thesisDB);
    } else 
    {
        test:assertFail(<string>thesisDB.detail()["message"]);
    }

    }


    resource function examination(kafka:Panel kafkaPanel, kafka:PanelDocuments[] documents) {
    string stage = "You Are Accepted Into The \nExamination Stage!";
    var examinationDB = examinationClient->tweet(stage);

    if (examinationDB is stage) 
    {
        test:assertEquals(examinationDB.text, stage, "Not Accepted!");
        io:println(examinationDB);
    } else 
    {
        test:assertFail(<string>examinationDB.detail()["message"]);
    }
}


resource function graduation(kafka:Panel kafkaPanel, kafka:PanelDocuments[] documents) {
    string stage = "You Have Officially Graduated!";
    var graduationDB = graduationClient->tweet(stage);

    if (graduationDB is stage) 
    {
        test:assertEquals(graduationDB.text, stage, "Not graduated");
        io:println(graduationDB);
    } else 
    {
        test:assertFail(<string>graduationDB.detail()["message"]);
    }
}
}
