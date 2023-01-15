public with sharing class CookbookBot_GetTranscriptVariables {
public class TranscriptInput {
@InvocableVariable(required=true)
public ID routableID;
}
public class VisitorNameOutput {
@InvocableVariable(required=true)
public String sFirstName;
}
@InvocableMethod(label='Get User Name')
public static List<VisitorNameOutput> getUserName(List<TranscriptInput> transcripts)
{
List<VisitorNameOutput> names = new List<VisitorNameOutput>();
for (TranscriptInput transcript : transcripts) {
// Query for the transcript record based on the ID

LiveChatTranscript transcriptRecord = [SELECT Name, First_Name__c
FROM LiveChatTranscript
WHERE Id = :transcript.routableID
LIMIT 1];
// Store the first name in an output variable
VisitorNameOutput nameData = new VisitorNameOutput();
nameData.sFirstName = transcriptRecord.First_Name__c;
// Add the name to the list of outputs
names.add(nameData);
}
return names;
}
}