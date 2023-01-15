public class CL_INT_1712_Eg1_JsonGen2
{
  public void createJson()
    {
        system.JSONGenerator js = json.createGenerator(true); // step1:- create json generator
        js.writeStartObject();                                // step2:- start writing to json
          try
          {
              List<Account> acc = [select name,phone from account where phone <> null];
              
              for(Account Ea : acc)
              {              
                                                     
              js.writeStringField('name',Ea.Name);
              js.writeStringField('mobilenumber',Ea.Phone);
              js.writeStringField('status','success');
              js.writeNumberField('code',100);
              }
          }
          catch(exception e)
          {
              js.writeStringField('status','Failure');
              //js.writeIdField('accId',a.Id);
              //js.writeStringField('MSG',e.getMessage());
              js.writeNumberField('code',200);
          }
        js.writeEndObject();                                  // step4: End writing to Json
        string result = js.getAsString();                     // step5: get final output json
        system.debug(result);                                     // step6: see/check the output
        
    }
}